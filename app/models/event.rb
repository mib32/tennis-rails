class Event < ActiveRecord::Base
  belongs_to :order
  belongs_to :court
  has_many :event_changes
  has_many :additional_event_items, dependent: :destroy

  delegate :user, to: :order

  validates_presence_of :court

  scope :paid, -> { joins(:order).where('orders.status =  ?', Order.statuses[:paid]) }
  scope :paid_or_owned_by,  -> (user) do 
    if user
      joins(:order).where("(orders.user_id <> :id and orders.status = :st) or orders.user_id = :id ", { id: user.id, st: Order.statuses[:paid]} )
    else
      joins(:order).where('orders.status =  ?', Order.statuses[:paid])
    end
  end
  scope :of_coach, ->(coach) { joins(:additional_event_items).where("additional_event_items.related_type = 'User' and additional_event_items.related_id = ? ", coach.id)}

  # before_update :before_register_change
  before_update :register_change

  def self.strong_params
   [ :id, :court_id, :start, :end, :recurrence_rule, :recurrence_id, :recurrence_exception, :user_id, :is_all_day, :description, :start_timezone, :end_timezone, :owned]
  end

  def description
    attributes["description"] || ""
  end

  def total
    things = []
    things << dry_court_total
    things << dry_other_total
    things.inject(&:+)
  end

  def dry_court_total
    (court.try(:price).to_i * duration_in_hours.to_i).to_i
  end

  def dry_other_total
    additional_event_items.map(&:total).inject(&:+).to_i
  end

  def duration_in_hours
    (duration / 1.hour).ceil
  end

  def duration
    self.end - self.start
  end

  def owned_by user
    self.order.user.id == user.id if self.order && self.order.user && user
  end

  def owned= a
    # for syncronization with kendoScheduler
  end

  def register_change
    Rails.logger.debug self.start
    Rails.logger.debug changed_attributes
    if order.paid?
      Thread.new do
        ActiveRecord::Base.connection_pool.with_connection do
          new_or_last_order = Order.order('created_at desc').find_or_create_by(user: order.user, status: 'unpaid')
          if new_or_last_order.event_changes.where(event: self).any?
            new_or_last_order.event_changes.where(event: self).last.update summary: self.to_json
          else
            event_changes.create! summary: self.to_json, order: new_or_last_order
          end
        end
      end

      return false
    end
  end

end

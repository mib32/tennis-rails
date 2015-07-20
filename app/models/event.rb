class Event < ActiveRecord::Base
  belongs_to :order
  has_and_belongs_to_many :products
  has_and_belongs_to_many :product_services
  has_many :event_changes, dependent: :destroy
  has_many :additional_event_items, dependent: :destroy


  attr_reader :schedule

  delegate :user, to: :order

  # validates_presence_of :court

  scope :paid, -> { joins(:order).where('orders.status =  ?', Order.statuses[:paid]) }
  scope :past, -> { where('"end" < LOCALTIMESTAMP')}
  scope :future, -> { where('"start" > LOCALTIMESTAMP')}
  scope :paid_or_owned_by,  -> (user) do 
    if user
      joins(:order).where("(orders.user_id <> :id and orders.status = :st) or orders.user_id = :id ", { id: user.id, st: Order.statuses[:paid]} )
    else
      joins(:order).where('orders.status =  ?', Order.statuses[:paid])
    end
  end
  scope :of_coach, ->(coach) { joins(:additional_event_items).where("additional_event_items.related_type = 'User' and additional_event_items.related_id = ? ", coach.id)}
  scope :of_products, ->(*products) do
    joins(:events_products).
    where(events_products: {product_id: products}).uniq
  end
  
  before_update :register_change, unless: :skip_change_registering?


  after_initialize :build_schedule

  def self.strong_params
   [ :id, :start, :end, :recurrence_rule, :recurrence_id, :recurrence_exception, :user_id, :is_all_day, :description, :start_timezone, :end_timezone, :owned, product_service_ids: [], product_ids: []]
  end

  def description
    attributes["description"] || ""
  end

  def total
    [
      dry_product_total,
      dry_other_total,
     ].inject(&:+)
  end

  def dry_product_total
    (products.map(&:price).inject(&:+).to_i * duration_in_hours.to_i).to_i
  end

  def dry_other_total
    product_services.map(&:price).inject(&:+).to_i
  end

  # def dry_coach_total
    # additional_event_items.coach.map(&:total).inject(&:+).to_i
  # end

  def duration_in_hours
    (duration / 1.hour).ceil * occurrences
  end

  def duration
    self.end - self.start
  end

  def occurrences
    if @schedule.terminating?
      @schedule.all_occurrences.length
    else
      @schedule.occurrences(DateTime.current + 1.month).length
    end
  end

  def owned_by user
    self.order.user.id == user.id if self.order && self.order.user && user
  end

  def owned= a
    # for syncronization with kendoScheduler
  end

  def register_change
    # Rails.logger.debug self.start
    # Rails.logger.debug changed_attributes
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

  def recurring?
    recurrence_rule.present?
  end

  def skip_change_registering!
    @skip_change_registering = true
  end

  def skip_change_registering?
    @skip_change_registering
  end

private

  def build_schedule
    @schedule = IceCube::Schedule.new do |s|
      if recurring?
        s.add_recurrence_rule(IceCube::Rule.from_ical(recurrence_rule))
        if recurrence_exception.present? && recurrence_exception =~ /=/
          s.add_exception_rule(IceCube::Rule.from_ical(recurrence_exception))
        end
      else
        s.add_recurrence_rule(IceCube::SingleOccurrenceRule.new attributes["start"])
      end
    end
  end
end

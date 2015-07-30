class Event < ActiveRecord::Base
  include Changeable
  belongs_to :order
  has_and_belongs_to_many :products
  has_and_belongs_to_many :product_services # , dependent: :destroy - not sure
  has_many :additional_event_items, dependent: :destroy
  belongs_to :user

  attr_reader :schedule

  scope :paid, -> { joins("LEFT OUTER JOIN orders ON orders.id = events.order_id").where('orders.status =  ?', Order.statuses[:paid]) }
  scope :unpaid, -> { joins("LEFT OUTER JOIN orders ON orders.id = events.order_id").where('orders.status =  ? or orders.status is null', Order.statuses[:unpaid]) }
  scope :past, -> { where('"end" < ?', Time.current)}
  scope :future, -> { where('"start" > ?', Time.current)}
  scope :paid_or_owned_by,  -> (user) do 
    if user
      joins(:order).where("(orders.user_id <> :id and orders.status = :st) or orders.user_id = :id ", { id: user.id, st: Order.statuses[:paid]} )
    else
      joins(:order).where('orders.status =  ?', Order.statuses[:paid])
    end
  end
  scope :of_products, ->(*products) do
    joins(:events_products).
    where(events_products: {product_id: products}).uniq
  end

  after_initialize :build_schedule

  def self.strong_params
   [ :id, :start, :end, :recurrence_rule, :recurrence_id, :recurrence_exception, :user_id, :is_all_day, :description, :start_timezone, :end_timezone, :owned, product_service_ids: [], product_ids: []]
  end

  def description
    attributes["description"] || ""
  end

  def total
    associated_payables_with_price.map {|p| p[:total] }.inject(&:+)
  end

  def associated_payables
    (products + product_services)
  end

  def associated_payables_with_price
    associated_payables.map {|p| {product: p, total: p.price_for_event(self)}}
  end

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
      @schedule.occurrences(Time.current + 1.month).length
    end
  end

  def visual_type_for user
    case 
    when self.paid?
      'paid'
    when user && (self.user.id == user.id)
      'owned'
    else
      'disowned'
    end
  end

  def paid?
    order && order.paid?
  end

  def recurring?
    recurrence_rule.present?
  end

  def unpaid?
    !paid?
  end

  def product_names
    products.map(&:name).join(', ')
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

class EventChange < ActiveRecord::Base
  belongs_to :event
  belongs_to :order
  # validates_presence_of :event
  # enum status: [:unpaid, :paid]
  scope :paid, -> { joins("LEFT OUTER JOIN orders ON orders.id = event_changes.order_id").where('orders.status =  ?', Order.statuses[:paid]) }
  scope :unpaid, -> { joins("LEFT OUTER JOIN orders ON orders.id = event_changes.order_id").where('orders.status =  ? or orders.status is null', Order.statuses[:unpaid]) }

  def total
    event.court.change_price.to_i
  end
end

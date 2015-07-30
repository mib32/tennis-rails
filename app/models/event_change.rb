class EventChange < ActiveRecord::Base
  belongs_to :event
  belongs_to :order
  # validates_presence_of :event
  enum status: [:unpaid, :paid]

  def total
    event.court.change_price.to_i
  end
end

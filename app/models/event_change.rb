class EventChange < ActiveRecord::Base
  belongs_to :event
  enum status: [:unpaid, :paid]
end

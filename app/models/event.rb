class Event < ActiveRecord::Base
  belongs_to :order
  belongs_to :court
  has_many :event_repeats

  def description
    attributes["description"] || ""
  end
  def total
    court.price * duration_in_hours
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
end

class Event < ActiveRecord::Base
  belongs_to :stadium
  belongs_to :order
end

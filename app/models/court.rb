class Court < ActiveRecord::Base
  belongs_to :stadium
  has_many :events
end

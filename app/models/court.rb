class Court < ActiveRecord::Base
  belongs_to :stadium
  has_many :events

  def change_price
    attributes["change_price"] || 0
  end
end

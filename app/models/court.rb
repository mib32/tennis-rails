class Court < ActiveRecord::Base
  belongs_to :stadium
  has_many :events
  has_many :special_prices
  has_and_belongs_to_many :coaches, join_table: 'coaches_courts'

  def change_price
    attributes["change_price"] || 0
  end

  def price
    special_prices.current.price || attributes["price"]
  end
end

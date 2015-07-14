class Court < Product
  belongs_to :stadium, foreign_key: :parent_id
  has_many :events
  has_many :special_prices
  has_many :coaches_courts
  has_many :coaches, through: :coaches_courts

  def change_price
    attributes["change_pric"] || 0
  ende

  def price
    special_prices.current.price || attributes["price"]
  end

  def name_with_stadium
    stadium.name + ' - корт ' + name
  end
end

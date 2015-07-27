class Court < Product
  belongs_to :stadium, foreign_key: :parent_id
  has_many :special_prices
  has_many :coaches_courts
  has_many :coaches, through: :coaches_courts

  delegate :owner, to: :stadium

  def change_price
    attributes["change_price"] || 0
  end

  def price
    special_prices.current.price || super
  end

  def name_with_stadium
    stadium.name.to_s + ' - корт ' + name.to_s
  end

  def product_services
    if super.any?
      super
    else
      stadium.product_services
    end
  end

end

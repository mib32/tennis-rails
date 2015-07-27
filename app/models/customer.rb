class Customer < User
  def products
    Product.where id: events.map(&:product_ids).flatten
  end

  # def model_name
    # User.model_name
  # end
end
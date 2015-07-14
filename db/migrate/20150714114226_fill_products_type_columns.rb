class FillProductsTypeColumns < ActiveRecord::Migration
  def change
    Product.update_all type: 'Stadium'
  end
end

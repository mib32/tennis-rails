class AddChangePriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :change_price, :decimal, precision: 8, scale: 2
  end
end

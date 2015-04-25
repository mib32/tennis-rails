class AddChangePriceToCourts < ActiveRecord::Migration
  def change
    add_column :courts, :change_price, :decimal, precision: 8, scale: 2
  end
end

class AddPriceToCoachesCourts < ActiveRecord::Migration
  def change
    add_column :coaches_courts, :price, :decimal, precision: 8, scale: 2, default: 0.00
  end
end

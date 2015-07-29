class RenameCourtIdInSpecialPrices < ActiveRecord::Migration
  def change
    rename_column :special_prices, :court_id, :product_id
  end
end

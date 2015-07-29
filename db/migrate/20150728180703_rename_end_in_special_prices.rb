class RenameEndInSpecialPrices < ActiveRecord::Migration
  def change
    rename_column :special_prices, :end, :stop
  end
end

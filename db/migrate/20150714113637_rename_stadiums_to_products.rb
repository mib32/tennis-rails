class RenameStadiumsToProducts < ActiveRecord::Migration
  def change
    rename_table :stadiums, :products
  end
end

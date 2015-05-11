class RemoveTotalFromWallets < ActiveRecord::Migration
  def change
    remove_column :wallets, :total
  end
end

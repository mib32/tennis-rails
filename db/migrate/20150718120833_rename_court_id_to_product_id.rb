class RenameCourtIdToProductId < ActiveRecord::Migration
  def change
    rename_column :events, :court_id, :product_id
  end
end

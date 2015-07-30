class AddTypeToProductServices < ActiveRecord::Migration
  def change
    add_column :product_services, :type, :string
  end
end

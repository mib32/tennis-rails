class AddAddressToStadiums < ActiveRecord::Migration
  def change
    add_column :stadiums, :address, :string
  end
end

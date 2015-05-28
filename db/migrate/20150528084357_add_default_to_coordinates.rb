class AddDefaultToCoordinates < ActiveRecord::Migration
  def change
    change_column :stadiums, :latitude, :float, default: 55.75
    change_column :stadiums, :longitude, :float, default: 37.61

    add_column :stadiums, :status, :integer, default: 0
  end
end

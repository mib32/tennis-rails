class AddCoordinatesToStadiums < ActiveRecord::Migration
  def change
    add_column :stadiums, :latitude, :float
    add_column :stadiums, :longitude, :float
  end
end

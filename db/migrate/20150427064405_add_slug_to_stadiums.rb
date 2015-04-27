class AddSlugToStadiums < ActiveRecord::Migration
  def change
    add_column :stadiums, :slug, :string
  end
end

class CreateStadiums < ActiveRecord::Migration
  def change
    create_table :stadiums do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :phone
      t.text :description

      t.timestamps null: false
    end
  end
end

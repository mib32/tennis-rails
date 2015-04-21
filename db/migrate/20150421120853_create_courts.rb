class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :name
      t.belongs_to :stadium, index: true, foreign_key: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end

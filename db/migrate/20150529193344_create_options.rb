class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :tax, default: 5

      t.timestamps null: false
    end
  end
end

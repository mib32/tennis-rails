class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.decimal :total, precision: 8, scale: 2
      t.integer :status

      t.timestamps null: false
    end
  end
end

class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.belongs_to :wallet, index: true, foreign_key: true
      t.integer :status
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end

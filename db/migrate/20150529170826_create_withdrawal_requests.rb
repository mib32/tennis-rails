class CreateWithdrawalRequests < ActiveRecord::Migration
  def change
    create_table :withdrawal_requests do |t|
      t.belongs_to :wallet, index: true, foreign_key: true
      t.integer :status
      t.decimal :amount, precision: 8, scale: 2
      t.text :data

      t.timestamps null: false
    end
  end
end

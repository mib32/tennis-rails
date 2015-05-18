class CreateDepositResponses < ActiveRecord::Migration
  def change
    create_table :deposit_responses do |t|
      t.belongs_to :deposit_request, index: true, foreign_key: true
      t.integer :status
      t.text :data

      t.timestamps null: false
    end
  end
end

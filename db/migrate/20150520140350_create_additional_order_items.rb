class CreateAdditionalOrderItems < ActiveRecord::Migration
  def change
    create_table :additional_order_items do |t|
      t.references :related, polymorphic: true, index: true
      t.belongs_to :order, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end

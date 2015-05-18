class CreateSpecialPrices < ActiveRecord::Migration
  def change
    create_table :special_prices do |t|
      t.datetime :start
      t.datetime :end
      t.integer :price
      t.boolean :is_sale
      t.belongs_to :court, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateEventsProductServices < ActiveRecord::Migration
  def change
    create_table :events_product_services do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :product_service, index: true, foreign_key: true
    end
  end
end

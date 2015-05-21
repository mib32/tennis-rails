class AddOrderIdToEventChanges < ActiveRecord::Migration
  def change
    add_reference :event_changes, :order, index: true, foreign_key: true
  end
end

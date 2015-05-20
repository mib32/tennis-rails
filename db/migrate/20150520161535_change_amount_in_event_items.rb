class ChangeAmountInEventItems < ActiveRecord::Migration
  def change
    change_column :additional_event_items, :amount, :integer, default: 1
  end
end

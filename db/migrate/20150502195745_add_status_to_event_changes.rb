class AddStatusToEventChanges < ActiveRecord::Migration
  def change
    add_column :event_changes, :status, :integer
  end
end

class RemoveDeltaFromEventChanges < ActiveRecord::Migration
  def change
    remove_column :event_changes, :start_delta, :string
    remove_column :event_changes, :duration_delta, :string
  end
end

class AddSummaryAgainToEventChanges < ActiveRecord::Migration
  def change
    add_column :event_changes, :summary, :string
  end
end

class AddKendoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :recurrence_rule, :string
    add_column :events, :recurrence_exception, :string
    add_column :events, :recurrence_id, :integer
    add_column :events, :is_all_day, :boolean
  end
end

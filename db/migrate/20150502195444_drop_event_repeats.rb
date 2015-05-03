class DropEventRepeats < ActiveRecord::Migration
  def change
    drop_table :event_repeats
  end
end

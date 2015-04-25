class CreateEventChanges < ActiveRecord::Migration
  def change
    create_table :event_changes do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.string :start_delta
      t.string :duration_delta

      t.timestamps null: false
    end
  end
end

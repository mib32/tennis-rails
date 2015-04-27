class CreateEventRepeats < ActiveRecord::Migration
  def change
    create_table :event_repeats do |t|
      t.datetime :start
      t.integer :interval
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

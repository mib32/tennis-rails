class CreateCoachesCourts < ActiveRecord::Migration
  def change
    create_table :coaches_courts do |t|
      t.belongs_to :coach, index: true
      t.belongs_to :court, index: true
    end
  end
end

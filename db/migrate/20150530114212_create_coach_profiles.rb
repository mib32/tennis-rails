class CreateCoachProfiles < ActiveRecord::Migration
  def change
    create_table :coach_profiles do |t|
      t.string :description
      t.string :photo
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

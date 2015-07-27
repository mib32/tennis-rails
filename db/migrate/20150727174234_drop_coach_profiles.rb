class DropCoachProfiles < ActiveRecord::Migration
  def change
    drop_table :coach_profiles
  end
end

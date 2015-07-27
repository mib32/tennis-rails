class MoveCoachesToNewTable < ActiveRecord::Migration
  def change
    User.where(type: 'Coach').update_all type: 'CoachUser'

    add_column :products, :email, :string
    remove_foreign_key "coach_profiles", "users"
    CoachUser.all.each do |coach|
      id = Coach.create name: coach.name, phone: coach.phone, email: coach.email
      CoachProfile.where(user_id: coach.id).update_all user_id: id
      CoachesCourt.where(coach_id: coach.id).update_all coach_id: id
    end
    rename_column :coach_profiles, :user_id, :coach_id
    add_foreign_key "coach_profiles", "products", column: "coach_id"
  end
end

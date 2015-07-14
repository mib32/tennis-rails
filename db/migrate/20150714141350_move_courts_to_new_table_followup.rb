class MoveCourtsToNewTableFollowup < ActiveRecord::Migration
  def change
    old_courts = execute('select id, name, stadium_id from courts')

    old_courts.each do |c|
      id = Court.create name: c["name"], parent_id: c["stadium_id"]
      CoachesCourt.where(court_id: c["id"]).update_all court_id: id
    end

    drop_table :courts, force: :cascade
  end
end

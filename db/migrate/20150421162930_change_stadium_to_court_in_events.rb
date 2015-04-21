class ChangeStadiumToCourtInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :stadium_id, :court_id
  end
end

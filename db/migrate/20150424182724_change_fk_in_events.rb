class ChangeFkInEvents < ActiveRecord::Migration
  def change
    remove_foreign_key "events", "courts"
    add_foreign_key "events", "courts"
  end
end

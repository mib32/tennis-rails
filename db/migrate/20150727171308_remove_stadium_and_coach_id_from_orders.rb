class RemoveStadiumAndCoachIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :stadium_id
    remove_column :orders, :coach_id
  end
end

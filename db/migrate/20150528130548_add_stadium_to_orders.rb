class AddStadiumToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :stadium, index: true, foreign_key: true
  end
end

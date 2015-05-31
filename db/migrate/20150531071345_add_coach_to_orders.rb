class AddCoachToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :coach, index: true
  end
end

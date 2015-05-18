class AddDataToDepositRequests < ActiveRecord::Migration
  def change
    add_column :deposit_requests, :data, :text
  end
end

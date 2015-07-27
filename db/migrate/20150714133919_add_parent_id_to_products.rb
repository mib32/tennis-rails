class AddParentIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :parent, index: true
  end
end

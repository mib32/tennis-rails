class ChangeStadiumsCategoriesRelationship < ActiveRecord::Migration

  def change
    create_join_table :categories, :stadiums do |t|
      t.index [:category_id, :stadium_id]
      t.index [:stadium_id, :category_id]
    end
    remove_foreign_key :stadiums, :category
  end
end

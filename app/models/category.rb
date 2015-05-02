class Category < ActiveRecord::Base
  has_many :stadiums
  has_ancestry

  include FriendlyId
  friendly_id :name, use: [:slugged]
end

class Category < ActiveRecord::Base
  default_scope { order(created_at: :desc)}
  has_many :stadiums
  has_ancestry

  include FriendlyId
  friendly_id :name, use: [:slugged]
end

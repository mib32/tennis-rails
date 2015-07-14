class Product < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  include FriendlyId
  friendly_id :name, use: [:slugged]

  enum status: [:pending, :active, :locked]

  belongs_to :category
  belongs_to :owner, class_name: 'User'

  has_many :pictures, as: :imageable
  has_many :reviews, as: :reviewable
  mount_uploader :avatar, PictureUploader

  has_many :orders, dependent: :destroy
end
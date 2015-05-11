class Stadium < ActiveRecord::Base
  include FriendlyId
  friendly_id :name, use: [:slugged]
  
  belongs_to :category
  belongs_to :user
  has_many :events, through: :courts
  has_many :courts
  accepts_nested_attributes_for :courts, :reject_if => :all_blank, :allow_destroy => true

  has_many :pictures, as: :imageable


  validates_presence_of :phone

  def as_json params={}
    {
      position: {
        lat: latitude.to_f,
        lng: longitude.to_f
      },
      name: name
    }
  end
end

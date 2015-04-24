class Stadium < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :events, through: :courts
  has_many :courts
  accepts_nested_attributes_for :courts, :reject_if => :all_blank, :allow_destroy => true


  validates_presence_of :phone

  def as_json params={}
    {
      position: {
        lat: latitude.to_f,
        lng: longitude.to_f
      },
    }
  end
end

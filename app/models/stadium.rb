class Stadium < Product
  
  has_many :courts, dependent: :destroy, foreign_key: :parent_id
  has_many :coaches, through: :courts
  
  accepts_nested_attributes_for :courts, :reject_if => :all_blank, :allow_destroy => true

  

  # validates_presence_of :phone

  def as_json params={}
    {
      # TODO: uncomment
      #icon: ActionController::Base.helpers.asset_path(category.icon),
      position: {
        lat: latitude.to_f,
        lng: longitude.to_f
      },
      name: name
    }
  end

end
 
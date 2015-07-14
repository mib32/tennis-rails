class Coach < Product
  has_many :coaches_courts
  has_many :courts, through: :coaches_courts
  has_one :profile, dependent: :destroy, class_name: 'CoachProfile'
  accepts_nested_attributes_for :profile
end
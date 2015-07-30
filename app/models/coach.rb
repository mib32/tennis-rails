class Coach < Product
  has_many :coaches_courts
  has_many :courts, through: :coaches_courts


  def has_courts?
    courts.size > 0
  end


  def name_with_stadium
    name
  end
end
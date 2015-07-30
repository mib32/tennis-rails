class StadiumUser < User
  has_one :stadium, foreign_key: "user_id", dependent: :destroy
  has_one :product, foreign_key: "user_id", dependent: :destroy
  
  delegate :courts, to: :stadium

  enum status: [:pending, :active]
  after_initialize :set_status, if: :new_record?
  after_initialize :make_stadium, unless: "stadium.present?"

  def set_status
    self.status = "pending" unless self.status
  end

  def make_stadium
    self.create_stadium 
  end

  def name
    attributes["name"] || attributes["email"]
  end

  # def model_name
    # User.model_name
  # end


  def products
    stadium.courts
  end
end
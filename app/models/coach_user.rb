class CoachUser < User
  has_one :coach, foreign_key: "user_id", dependent: :destroy
  has_one :product, foreign_key: "user_id", dependent: :destroy
  
  after_initialize :make_coach, unless: "coach.present?"
  accepts_nested_attributes_for :coach

  delegate :description, to: :coach
  # validate :has_at_least_one_court

  def make_coach
    self.create_coach
  end


  def has_at_least_one_court
    if courts.size < 1
      errors.add :courts, 'Выберите хотя бы один корт.'
    end
  end

  def name
    attributes["name"] || "Тренер ##{id}"
  end

  # def events
    # Event.joins(:additional_event_items).where('additional_event_items.related_type = ? and additional_event_items.related_id = ?', 'User', self.id)
  # end



  def products
    coach.courts
  end

end
class Coach < User
  include Gravtastic
  is_gravtastic
  
  has_and_belongs_to_many :courts, join_table: 'coaches_courts'

  validate :has_at_least_one_court

  def has_at_least_one_court
    if courts.size < 1
      errors.add :courts, 'Выберите хотя бы один корт.'
    end
  end

  def name
    attributes["name"] || "Тренер ##{id}"
  end
end
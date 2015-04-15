class Coach < User
  include Gravtastic
  is_gravtastic

  def name
    attributes["name"] || "Тренер ##{id}"
  end
end
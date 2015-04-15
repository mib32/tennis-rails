class Stadium < User
  def name
    attributes["name"] || "Стадион ##{id}"
  end
end
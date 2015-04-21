class StadiumUser < User
  has_one :stadium, foreign_key: "user_id"

  def name
    attributes["name"] || "Стадион ##{id}"
  end
end
json.extract! event, :id, :start, :end, :description
json.owned event.owned_by(current_user)
json.user_name event.user.name || "Пользователь ##{event.user.id}"
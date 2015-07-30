json.extract! event, :id, :start, :end, :recurrence_rule, :recurrence_exception, :recurrence_id
json.description event.description.blank? ? (event.user.name || "Пользователь ##{event.user.id}") : event.description
json.visual_type event.visual_type_for(current_user)
json.user_name event.user.name || "Пользователь ##{event.user.id}"
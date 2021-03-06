json.extract! event, :id, :recurrence_rule, :recurrence_exception, :recurrence_id
json.start event.start_for(current_user)
json.end event.end_for(current_user)
json.description event.description.blank? ? (event.user || "Пользователь ##{event.user.id}") : event.description
json.visual_type event.visual_type_for(current_user)
json.user_name event.user.name || "Пользователь ##{event.user.id}"
json.court_name event.court.try(:name)
json.kendo_court_id event.court.try(:kendo_court_id).try(:to_s)
module EventsHelper
  def current_user_events_path
    if current_user.courts.any?
      dashboard_court_events_path(court_id: current_user.courts.first)
    end
  end
end

class Dashboard::Customer::EventsController < Dashboard::EventsController

  def index
    @events = current_user.events
  end

  def grid
    @events = current_user.events
  end
end
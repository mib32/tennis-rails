class Dashboard::EventsController < DashboardController
  before_filter :find_event, except: :index

  def index
    @events = current_user.events.joins(:court, order: :user).includes(:order)
    @events = @events.where(court_id: params[:court_id]) if params[:court_id]
    
    respond_to do |format|
      format.json { render 'events/index' }
      format.html { }
    end
  end

  private
  def find_event
    @event = Event.find(params[:id]) if params[:id]
  end
end
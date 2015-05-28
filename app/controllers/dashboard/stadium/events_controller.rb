class Dashboard::Stadium::EventsController < Dashboard::EventsController
  def index
    @events = current_user.events.paid.joins(:court)
    @events = @events.where(court_id: params[:court_id]) if params[:court_id]
    
    respond_to do |format|
      format.json { render 'events/index' }
      format.html { }
    end
  end

  def create
    @event = current_user.stadium.events.new event_params.delete_if {|k,v| v.empty? }
    @event.order = Order.new user: current_user, status: 'paid'
    @event.court = Court.find params[:court_id]
    @event.save

    respond_to do |format|
      format.json { render 'events/_event', locals: { event: @event } }
    end
  end
end
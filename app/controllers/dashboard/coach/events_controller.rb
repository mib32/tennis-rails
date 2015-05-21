class Dashboard::Coach::EventsController < Dashboard::EventsController
  def index
    @events = current_user.events.paid.joins(:court, order: :user).includes(:order)
    @events = @events.where(court_id: params[:court_id]) if params[:court_id]
    
    respond_to do |format|
      format.json { render 'events/index' }
      format.html { }
    end
  end
end
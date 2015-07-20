class Dashboard::Coach::EventsController < Dashboard::EventsController
  # def index
  #   @events = current_user.events.paid.joins(:product)
  #   @events = @events.where(product_id: params[:court_id]) if params[:court_id]
    
  #   respond_to do |format|
  #     format.json { render 'events/index' }
  #     format.html { }
  #   end
  # end

  # def create
  #   @court = Court.find params[:court_id]
  #   @event = @court.events.new event_params.delete_if {|k,v| v.empty? }
  #   @event.order = Order.new user: current_user, status: 'paid'
  #   @event.additional_event_items.new related: current_user
  #   @event.save

  #   respond_to do |format|
  #     format.json { render 'events/_event', locals: { event: @event } }
  #   end
  # end

  def update
    @event = Event.find params[:id]
    @event.skip_change_registering!
    @event.update event_params

    respond_to do |format|
      format.json { render 'events/_event', locals: { event: @event } }
    end
  end

  def destroy
    @event = Event.find params[:id]
    @event.destroy

    respond_to do |format|
      format.json { render 'events/_event', locals: { event: @event } }
    end
  end

  def current_products
    court = params[:court_id].present? ? Court.find(params[:court_id]) : current_user.product.courts.first
    [court, current_user.product] 
  end
end
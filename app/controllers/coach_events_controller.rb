class CoachEventsController < EventsController
  before_action :set_coach 
  before_action :set_court
  def index
    @events = @court.events.paid_or_owned_by(current_user).of_coach(@coach)
#     @events = Event.joins(:court, order: :user).includes(:order)
#     @events = @events.where(court_id: params[:court_id]) if params[:court_id]
#     if current_user
#       @events = @events.where("(orders.user_id <> :id and orders.status = :st) or orders.user_id = :id ", { id: current_user.id, st: Order.statuses[:paid]} )
#     else
#       @events = @events.where(orders: { status: Order.statuses[:paid] })
#     end
    respond_to do |format|
      format.json {  }
      format.html {  }
    end
  end

  def create
    @order = Order.order('created_at desc').find_or_create_by(user: current_user, status: 'unpaid')
    @event = @order.events.new event_params.delete_if {|k,v| v.empty? }
    @event.court = @court
    @event.additional_event_items.new related: @coach, amount: @event.duration_in_hours

    @order.save
    respond_to do |format|
      format.json { render @event }
    end
  end

#   def update
#     @event = current_user.events.find(params[:id])
#     if @event.update event_params
#       if @event.order.paid?
#         @event.event_changes.create! summary: @event.to_json, status: 'unpaid'
#       end      
#     end

#     respond_with @event
#   end

#   def edit
#   end

#   def show
#     @event = Event.find(params[:id])

#     respond_with @event
#   end

  private
  def set_coach
    @coach = Coach.friendly.find params[:coach_id]
  end
  def set_court
    @court = @court || ( params[:court_id] && @coach.courts.find(params[:court_id]) ) || @coach.courts.first
  end
#   def event_params
#     params.require(:event).permit(Event.strong_params)
#   end
end

class EventsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!, except: :index

  def index
    @events = Event.joins(:court, order: :user).includes(:order)
    @events = @events.where(court_id: params[:court_id]) if params[:court_id]
    if current_user
      @events = @events.where("(orders.user_id <> :id and orders.status = :st) or orders.user_id = :id ", { id: current_user.id, st: Order.statuses[:paid]} )
    else
      @events = @events.where(orders: { status: Order.statuses[:paid] })
    end
    respond_with @events
  end

  def create
    @order = Order.order('created_at desc').find_or_create_by(user: current_user, status: 'unpaid')
    @event = @order.events.new event_params.delete_if {|k,v| v.empty? }

    @order.save
    respond_with @event
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.update event_params

    # if @event.order.unpaid?
    # end      

    respond_with @event
  end

  def edit
  end

  private
  def event_params
    params.require(:event).permit(:id, :court_id, :start, :end, :recurrence_rule, :recurrence_id, :recurrence_exception, :user_id, :is_all_day, :description, :start_timezone, :end_timezone, :owned)
  end
  # def set_court
    
  # end
end

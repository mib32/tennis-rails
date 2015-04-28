class EventsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    @events = Event.includes(:court, order: :user)
    @events.where(court_id: params[:court_id]) if params[:court_id]

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

    respond_with @event
  end

  def edit
  end

  private
  def event_params
    params.require(:event).permit(:id, :court_id, :start, :end, :recurrence_rule, :recurrence_id, :recurrence_exception, :user_id, :is_all_day, :description, :start_timezone, :end_timezone)
  end
  # def set_court
    
  # end
end

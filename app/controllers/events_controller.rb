class EventsController < ApplicationController
  respond_to :json, :html
  before_filter :authenticate_user!, except: :index
  # before_filter :set_court, except: :index

  def index
    # @events = Event.joins(:court, order: :user).includes(:order)
    # @events = @events.where(court_id: params[:court_id]) if params[:court_id]
    # if current_user
      # @events = @events.where("(orders.user_id <> :id and orders.status = :st) or orders.user_id = :id ", { id: current_user.id, st: Order.statuses[:paid]} )
    # else
      # @events = @events.where(orders: { status: Order.statuses[:paid] })
    # end
    @events = Event.of_products(current_products)
    respond_with @events
  end

  def private
    @events = current_user.events

    respond_with @events do |format|
      # format.html { render layout:  }
    end
  end

  def create
    @event = current_user.events.new event_params.delete_if {|k,v| v.empty? }
    @event.products = current_products
    @event.save!
    respond_with @event
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.update event_params

    respond_with @event
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])

    respond_with @event
  end

  private
  def event_params
    params.require(:event).permit(Event.strong_params)
  end
  def set_court
    # if params[:court_id]
    # @product = Product.friendly.find params[:court_id] || params[:coach_id]
    # else
      # raise 'Корт нужно указать'
    # end
  end

  def current_products
    [Court.where(slug: params[:court_id]).last, Coach.where(slug: params[:coach_id]).last].compact
  end
end

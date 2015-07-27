class OrdersController < DashboardController
  before_filter :authenticate_user!
  respond_to :json, :js, :html

  def total
    
  end

  def index 
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_user.orders.new
    @order.events = Event.find(params[:event_ids])

    @order.save!

    respond_with @order
  end

  def pay
    @order = Order.find(params[:id])
    @order.pay!

    respond_with @order
  end

end

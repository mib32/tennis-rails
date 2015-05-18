class Dashboard::OrdersController < DashboardController
  def index
    @orders = Order.joins(events: { court: :stadium }).where('stadiums.id = ?', current_user.stadium.id).paid
    # @events = current_user.stadium.events
  end
end
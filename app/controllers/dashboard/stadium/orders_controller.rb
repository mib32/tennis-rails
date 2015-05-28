class Dashboard::Stadium::OrdersController < DashboardController
  def index
    @orders = Order.joins(events: { court: :stadium }).where('stadiums.id = ? and orders.user_id <> ?', current_user.stadium.id, current_user.id).paid.uniq
    # @events = current_user.stadium.events
  end
end
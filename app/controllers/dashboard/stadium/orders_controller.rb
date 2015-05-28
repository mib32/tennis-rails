class Dashboard::Stadium::OrdersController < DashboardController
  def index
    @orders = Order.where('stadium_id = ? and orders.user_id <> ?', current_user.stadium.id, current_user.id).uniq
    # @events = current_user.stadium.events
  end

  def update
    @order = Order.find params[:id]

    @order.update order_params

    redirect_to dashboard_orders_path, notice: 'Статус заказа изменен'
  end


  private

  def order_params
    params.require(:order).permit(:status, :comment)
  end

end
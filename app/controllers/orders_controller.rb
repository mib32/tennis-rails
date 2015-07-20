class OrdersController < ApplicationController
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
    transaction = ActiveRecord::Base.transaction do
      @order.events.each do |event|
        if current_user.wallet.withdraw!(event.total)
          event.court.stadium.user.wallet.deposit!(event.dry_court_total)
          event.additional_event_items.each do |ai|
            ai.payment_receiver.wallet.deposit! ai.total
          end
        else
          redirect_to(dashboard_orders_path, alert: "Недостаточно средств") 
          raise ActiveRecord::Rollback
        end
      end
      @order.event_changes.each do |change|
        change.event.update JSON.parse(change.summary)
        if current_user.wallet.withdraw!(change.total)
          change.event.court.stadium.user.wallet.deposit!(change.total)
        else
          redirect_to(dashboard_orders_path, alert: "Недостаточно средств")
          raise ActiveRecord::Rollback
        end
      end
    end

    if transaction
      @order.status = "paid"
      @order.save
      respond_with @order, notice: 'Заказ успешно оплачен'
    end
  end

end

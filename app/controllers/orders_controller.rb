class OrdersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @orders = current_user.orders.order('created_at desc')
  end

  def new
    @order = Order.new user: current_user
    @order.events.new start: DateTime.parse(params[:start]), end: DateTime.parse(params[:end]), court_id: params[:court]
  end

  def show
    @order = Order.find params[:id]
  end

  def create
    @order = Order.new user: current_user, status: 'unpaid'
    params[:order][:events].each do |evt|
      @order.events.new start: evt[:start], end: evt[:end], court_id: params[:order][:court_id]
    end
    @order.save!

    respond_with @order

    # transaction = ActiveRecord::Base.transaction do
      # @order.events.each do |ev|
        # current_user.wallet.withdraw!(ev.total)
        # ev.court.stadium.user.wallet.deposit!(ev.total)
      # end
    # end

    # if transaction
    # @order.save
    # respond_with @order, notice: 'Заказ успешно создан'
    # redirect_to dashboard_path, notice: 'Заказ успешно создан.'
    # end
  end


  def pay
    @order = Order.find(params[:id])
    transaction = ActiveRecord::Base.transaction do
      @order.events.each do |event|
        current_user.wallet.withdraw!(event.total)
        event.court.stadium.user.wallet.deposit!(event.total)
      end
    end

    if transaction
      @order.status = "paid"
      @order.save
      respond_with @order, notice: 'Заказ успешно оплачен'
    end
  end

end

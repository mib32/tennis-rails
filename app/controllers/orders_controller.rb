class OrdersController < ApplicationController
  def new
    @order = Order.new user: current_user
    @order.events.new start: DateTime.parse(params[:start]), end: DateTime.parse(params[:end]), court_id: params[:court]
  end

  def create
    @order = Order.new user: current_user
    @order.events.new start: DateTime.parse(params[:start]), end: DateTime.parse(params[:end]), court_id: params[:court_id]

    transaction = ActiveRecord::Base.transaction do
      @order.events.each do |ev|
        current_user.wallet.withdraw!(ev.total)
        ev.court.stadium.user.wallet.deposit!(ev.total)
      end
    end

    if transaction
      @order.save
    end
  end
end

class OrderObserver < ActiveRecord::Observer
  def after_update order
    if order.status_changed?
      OrderMailer.order_change(order).deliver
    end
  end
end
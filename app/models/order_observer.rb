class OrderObserver < ActiveRecord::Observer
  def after_update order
    if order.status_changed?
      case order.status
      when 'paid'
        order.events.group_by(&:products).each do |product, events|
          OrderMailer.order_created(product, events, order).deliver
        end
      else
        OrderMailer.order_change(order).deliver
      end
    end
  end
end
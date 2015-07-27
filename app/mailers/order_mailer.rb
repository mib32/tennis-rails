class OrderMailer < ApplicationMailer
  helper :application

  def order_change order
    @order = order
    mail(to: [order.associated_emails, order.user.email], subject: '⚽️ Bookingsports: Заказ изменен - ' + order.human_status)
  end

  def order_created products, events, order
    @products, @events, @order = products, events, order
    mail(to: [products.map(&:owner).map(&:email), order.user.email].flatten, subject: '⚽️ Bookingsports: Заказ оплачен! ')
  end
end

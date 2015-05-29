class OrderMailer < ApplicationMailer

  def order_change order
    @order = order
    mail(to: [order.stadium.user.email, order.user.email], subject: '⚽️ Bookingsports: Заказ изменен - ' + order.human_status)
  end
end

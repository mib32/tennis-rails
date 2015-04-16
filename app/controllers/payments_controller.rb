# class PaymentsController < RobokassaController
#   def result_callback notification
#     payee = User.find notification.params['UserId']
#     payee.wallet.deposit! notification.total
#     render text: notification.success
#   end

#   def fail_callback notification
#   end  

#   def success_callback notification
#   end
# end
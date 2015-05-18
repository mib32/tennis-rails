class PaymentsController < DashboardController
  def success
    @request = current_user.wallet.deposit_requests.find(params['OrderId'])
    @response = @request.payment_responses.new data: DepositResponseData.new(params)
    if @response.security_key == params["SecurityKey"]
      @request.status = :success
      @request.save 
      redirect_to dashboard_deposit_requests_path, notice: 'Кошелек успешно пополнен'
    else
      @request.status = :failure
      @request.save
      redirect_to dashboard_deposit_requests_path
    end
  end
end
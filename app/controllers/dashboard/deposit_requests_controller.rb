class Dashboard::DepositRequestsController < DashboardController
  def index
    @requests = current_user.wallet.deposit_requests
  end

  def show
  end

  def create
  end

  def new
  end
end

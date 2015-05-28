class OrdersController < DashboardController
  before_filter :authenticate_user!
  respond_to :json, :js

  def total
    
  end

end

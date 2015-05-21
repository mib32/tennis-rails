class Dashboard::Coach::CustomersController < DashboardController
  before_filter :find_customer, except: :index

  def index
    @customers = 
  end

  private
  def find_customer
    @customer = Customer.find(params[:id]) if params[:id]
  end
end
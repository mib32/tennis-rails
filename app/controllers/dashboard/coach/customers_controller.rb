class Dashboard::Coach::CustomersController < Dashboard::Coach::CoachesController
  before_filter :find_customer, except: :index

  def index
    @customers = @coach.customers
  end


  private
  def find_customer
    @customer = User.find(params[:id]) if params[:id]
  end
end
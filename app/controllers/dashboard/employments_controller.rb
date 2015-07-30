class Dashboard::EmploymentsController < DashboardController
  def index
    @courts = current_user.coach.coaches_courts
  end

  def create
    @court = Court.find(params[:coaches_court][:court_id])
    current_user.coach.coaches_courts.new court: @court, price: params[:coaches_court][:price]
    current_user.coach.save

    redirect_to dashboard_employments_path
  end

  def destroy
    current_user.coach.coaches_courts.find(params[:id]).delete

    redirect_to dashboard_employments_path
  end
end
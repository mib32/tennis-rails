class Dashboard::Coach::CourtsController < Dashboard::Coach::CoachesController
  def index
    @courts = @coach.coaches_courts
  end

  def create
    @court = Court.find(params[:coaches_court][:court_id])
    @coach.coaches_courts.new court: @court, price: params[:coaches_court][:price]
    @coach.save

    redirect_to dashboard_courts_path
  end

  def destroy
    @coach.coaches_courts.find(params[:id]).delete

    redirect_to dashboard_courts_path
  end
end
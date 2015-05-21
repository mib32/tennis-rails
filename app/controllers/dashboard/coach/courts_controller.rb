class Dashboard::Coach::CourtsController < Dashboard::Coach::CoachesController
  def index
    @courts = @coach.courts
  end

  def create
    @court = Court.find(params[:coaches_court][:court_id])
    @coach.courts << @court
    @coach.save

    redirect_to dashboard_courts_path
  end

  def destroy
    @court = Court.find(params[:id])
    @coach.courts.delete(@court)

    redirect_to dashboard_courts_path
  end
end
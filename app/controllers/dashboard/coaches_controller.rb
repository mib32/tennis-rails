class Dashboard::CoachesController < DashboardController
  before_filter :find_coach, except: [ :index, :new, :create ]

  def index
    @coaches = current_user.stadium.coaches
  end

  def new
    @coach = Coach.new
  end

  def create
    if (coach_params[:court_ids] & current_user.stadium.court_ids).size == coach_params[:court_ids].size
      @coach = Coach.new coach_params
      if @coach.save
        redirect_to dashboard_stadium_coaches_path, notice: 'Тренер успешно создан'
      else
        render :new
      end
    else
      redirect_to new_dashboard_stadium_coach_path, alert: 'Можно использовать корты только вашего стадиона.'
    end

  end
  private
  def find_coach
    @coach = Coach.friendly.find(params[:id]) if params[:id]
  end

  def coach_params
    params.require(:coach).permit(devise_parameter_sanitizer.for(:account_create) + [:court_ids])
  end
end
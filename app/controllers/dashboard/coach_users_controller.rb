class Dashboard::CoachUsersController < DashboardController
  before_filter :find_coach, except: [ :index, :new, :create ]

  def index
    @coaches = current_user.stadium.coaches.uniq
  end

  def new
    @coach = CoachUser.new
  end

  def create
    # TODO add defence strategy if court_ids in params are of not current_user's stadium
    @coach = CoachUser.new coach_user_params
    if @coach.save
      redirect_to dashboard_coach_users_path, notice: 'Тренер успешно создан'
    else
      render :new
    end
  end

  def update
    if @coach.update coach_user_params
      redirect_to dashboard_coach_user_path, notice: 'Тренер успешно сохранен'
    else
      render :edit
    end
  end
  private
  def find_coach
    @coach = ::Coach.friendly.find(params[:id]) if params[:id]
  end

  def coach_user_params
    params.require(:coach_user).permit(:name, :password, :password_confirmation, :email, :price, coach_attributes: {court_ids: []})
  end
end
class Dashboard::CoachesController < DashboardController
  before_filter :find_coach

  def edit
  end

  def update
    @stadium.update stadium_params

    render :edit
  end

  private
  def find_coach
    @coach = current_user
  end
  def stadium_params
    params.require(:stadium).permit(:name, :address, :telephone, :description, :category_id, :phone, :latitude, :longitude,
      courts_attributes: [:id, :name, :price, :change_price, :_destroy])
  end
end
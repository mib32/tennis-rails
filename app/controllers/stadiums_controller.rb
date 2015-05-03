class StadiumsController < ApplicationController
  before_action :set_stadium, only: [:show, :edit, :update]
  respond_to :html, :js, :json

  def index
    @stadiums = Stadium.all

    if params[:category_id].present?
      @stadiums = Category.friendly.find(params[:category_id]).stadiums
    end
    if params[:name].present?
      @stadiums = @stadiums.where('name ilike ?', '%' + params[:name] + '%')
    end
    if params[:place].present?
      
    end

    respond_with @stadiums
  end

  def show
  end

  def update
    @stadium.update stadium_params

    respond_with @stadium
  end

  private
  def set_stadium
    @stadium  = Stadium.friendly.find(params[:id])
  end

  def stadium_params
    params.require(:stadium).permit(:name, :address, :telephone, :description, :category_id, :phone, :latitude, :longitude,
      courts_attributes: [:id, :name, :price, :change_price, :_destroy])
  end
end

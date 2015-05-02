class StadiumsController < ApplicationController
  before_action :set_stadium, only: [:show, :edit, :update]
  respond_to :html, :js

  def index
    if params[:category_id]
      @stadiums = Category.friendly.find(params[:category_id]).stadiums
    else
      @stadiums = Stadium.all
    end
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

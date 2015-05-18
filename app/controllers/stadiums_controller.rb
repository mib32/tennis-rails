class StadiumsController < ApplicationController
  before_action :set_stadium, only: [:show, :edit, :update]
  respond_to :html, :js, :json

  def index
    @stadiums = Stadium.all

    if params[:category_id].present?
      @category = Category.friendly.find(params[:category_id])
      @stadiums = @category.stadiums
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

  private
  def set_stadium
    @stadium  = Stadium.friendly.find(params[:id])
  end  
end

class CourtsController < ApplicationController
  respond_to :json
  def index
  end

  def show
    @court = Court.find(params[:id])

    respond_with @court
  end
end

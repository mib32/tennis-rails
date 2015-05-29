class CoachesController < ApplicationController
  def index
    @q = Coach.ransack(params[:q])
    @coaches = @q.result(distinct: true)
  end

  def show
    @coach = Coach.friendly.find params[:id]
  end
end

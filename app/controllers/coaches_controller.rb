class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end
end

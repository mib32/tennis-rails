class StadiumsController < ApplicationController
  def index
    @stadiums = Stadium.all
  end
end

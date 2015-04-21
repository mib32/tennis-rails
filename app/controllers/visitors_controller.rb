class VisitorsController < ApplicationController

  def index
    @stadiums = Stadium.all
  end
end

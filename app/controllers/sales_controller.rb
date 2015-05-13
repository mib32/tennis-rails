class SalesController < ApplicationController
  def index
    @sales = Stadium.all
  end
end

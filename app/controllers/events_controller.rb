class EventsController < ApplicationController
  before_action :set_court
  respond_to :json

  def index
    if params[:end] && params[:start]
      @events = @court.events.where(start: params[:start]..params[:end], end: params[:start]..params[:end])
    end

    respond_with @events
  end

  def create
  end

  def update
  end

  def edit
  end

  private
  def set_court
    @court = Court.find(params[:court_id])
  end
end

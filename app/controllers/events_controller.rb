class EventsController < ApplicationController
  respond_to :json

  def index
    if params[:end] && params[:start]
      @events = Event.joins(:court, order: :user).where(start: params[:start]..params[:end], end: params[:start]..params[:end])
      if params[:court_id]
        @events = @events.where(court_id: params[:court_id])
      end
    end

    if params[:user]
      @events = @events.where(orders: {user_id: current_user.id})
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
  # def set_court
    
  # end
end

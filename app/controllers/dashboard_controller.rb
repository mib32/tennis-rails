class DashboardController < ApplicationController
  before_filter :authenticate_user!

  # before_filter :check_stadium
  
  def show
    @user = current_user
  end

  def payment_settings
  end
end
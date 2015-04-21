class DashboardController < ApplicationController
  def edit
    @user = current_user
  end
end
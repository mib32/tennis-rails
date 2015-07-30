class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_params, if: :devise_controller?
  before_action :find_static_pages
  layout :set_layout


  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      if current_user.type == 'Admin'
        admin_stadiums_path
      else
        dashboard_grid_path
      end
    else
      stored_location_for(resource) || request.referer || dashboard_grid_path
    end
  end
 
  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:account_update) << [:name, :public_type, :phone]
    devise_parameter_sanitizer.for(:sign_up) << [:name, :public_type, :phone]
  end

  def set_layout
    if current_user && devise_controller?
      'dashboard'
    end
  end

  def find_static_pages
    @pages = StaticPage.all
  end

  def current_products
    nil
  end
end

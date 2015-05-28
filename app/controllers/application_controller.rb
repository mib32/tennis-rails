class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_params, if: :devise_controller?
  before_action :find_parent_record, if: :nested_resource?
  layout :set_layout


  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      if current_user.type == 'Admin'
        admin_stadiums_path
      else
        dashboard_path
      end
    else
      stored_location_for(resource) || request.referer || dashboard_path
    end
  end
 
  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def set_layout
    if nested_resource?
      params[:model_name].underscore
    end
  end
  def nested_resource?
    params[:model_name].present? && ( params[:controller] != params[:model_name].underscore.pluralize || params[:action] == 'show')
  end

  def find_parent_record
    klass = params[:model_name].constantize
    id_param = params[:action] == 'show' ? 'id' : params[:model_name].underscore + '_id'
    @record = klass.friendly.find(params[id_param])
    instance_variable_set('@' + params[:model_name].underscore, @record)
  end
end

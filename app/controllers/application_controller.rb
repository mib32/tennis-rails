class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_params, if: :devise_controller?
  before_action :find_parent_record, if: :nested_recource?
  layout :set_layout

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def set_layout
    params[:model_name].try(:underscore) || 'application'
  end
  def nested_recource?
    params[:model_name].present?
  end

  def find_parent_record
    return if params[:controller] == params[:model_name].underscore.pluralize
    klass = params[:model_name].constantize
    id_param = params[:model_name].underscore + '_id'
    @record = klass.friendly.find(params[id_param])
    instance_variable_set('@' + params[:model_name].underscore, @record)
  end
end

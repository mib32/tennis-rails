class CourtsController < ApplicationController
  # respond_to :json
  layout :set_layout
  before_filter :set_scope
  def index
  end

  def show
    @court = Court.friendly.find params[:id]
  end

  def set_layout
    params[:scope] || 'application'
  end

  def set_scope
    if params[:scope]
      scope = params[:scope]
      record = scope.classify.constantize.friendly.find params[scope+'_id'] || params[:id]
      instance_variable_set('@'+params[:scope], record)
      instance_variable_set('@product', record)
    end
  end
end

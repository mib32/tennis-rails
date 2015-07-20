class CourtsController < ApplicationController
  # respond_to :json
  layout :set_layout
  before_filter :set_scope
  def index
  end

  def show
    @court = Court.friendly.find(params[:id])

    respond_to do |format|
      format.json { render json: @court.to_json(include: {product_services: {methods: :service_name_and_price}}) }
      format.html {  }
    end
  end

  def set_layout
    params[:layout] || 'application'
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

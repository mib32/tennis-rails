class CourtsController < ApplicationController
  # respond_to :json
  def index
  end

  def show
    @court = Court.find(params[:id])

    respond_to do |format|
      format.json { render json: @court.to_json(include: {product_services: {methods: :service_name_and_price}}) }
    end
  end
end

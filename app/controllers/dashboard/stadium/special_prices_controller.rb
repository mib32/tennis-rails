class Dashboard::Stadium::SpecialPricesController < DashboardController
  before_action :set_special_price, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/special_prices
  # GET /dashboard/special_prices.json
  def index
    @court = current_user.stadium.courts.find(params[:court_id])
    @special_prices = SpecialPrice.where(court_id: @court.id)
  end

  # GET /dashboard/special_prices/1
  # GET /dashboard/special_prices/1.json
  def show
  end

  # GET /dashboard/special_prices/new
  def new
    @court = current_user.stadium.courts.find(params[:court_id])
    @special_price = SpecialPrice.new
  end

  # GET /dashboard/special_prices/1/edit
  def edit
  end

  # POST /dashboard/special_prices
  # POST /dashboard/special_prices.json
  def create
    @court = current_user.stadium.courts.find(params[:court_id])
    @special_price = @court.special_prices.new(special_price_params)

    respond_to do |format|
      if @special_price.save
        format.html { redirect_to dashboard_court_special_prices_path(@court), notice: 'Период создан.' }
        format.json { render :show, status: :created, location: @special_price }
      else
        format.html { render :new }
        format.json { render json: @special_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/special_prices/1
  # PATCH/PUT /dashboard/special_prices/1.json
  def update
    respond_to do |format|
      if @special_price.update(special_price_params)
        format.html { redirect_to dashboard_court_special_prices_path, notice: 'Период обновлен.' }
        format.json { render :show, status: :ok, location: @special_price }
      else
        format.html { render :edit }
        format.json { render json: @special_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/special_prices/1
  # DELETE /dashboard/special_prices/1.json
  def destroy
    @special_price.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_court_special_prices_url, notice: 'Период успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special_price
      @court = current_user.stadium.courts.find(params[:court_id])
      @special_price = @court.special_prices.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_price_params
      params.require(:special_price).permit(:start, :end, :price, :is_sale, :court_id)
    end
end

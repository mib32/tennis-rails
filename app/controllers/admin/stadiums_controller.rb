class Admin::StadiumsController < AdminController
  before_action :set_stadium, only: [:show, :edit, :update, :destroy]

  # GET /admin/stadiums
  # GET /admin/stadiums.json
  def index
    @stadiums = Stadium.all
  end

  # GET /admin/stadiums/1
  # GET /admin/stadiums/1.json
  def show
  end

  # GET /admin/stadiums/new
  def new
    @stadium = Stadium.new
  end

  # GET /admin/stadiums/1/edit
  def edit
  end

  # POST /admin/stadiums
  # POST /admin/stadiums.json
  def create
    @stadium = Stadium.new(stadium_params)

    respond_to do |format|
      if @stadium.save
        format.html { redirect_to [:admin, @stadium], notice: 'Stadium успешно создан(о).' }
        format.json { render action: 'show', status: :created, location: @stadium }
      else
        format.html { render action: 'new' }
        format.json { render json: @stadium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/stadiums/1
  # PATCH/PUT /admin/stadiums/1.json
  def update
    respond_to do |format|
      if @stadium.update(stadium_params)
        format.html { redirect_to [:admin, @stadium], notice: 'Stadium успешно обновлен(о).' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stadium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stadiums/1
  # DELETE /admin/stadiums/1.json
  def destroy
    @stadium.destroy
    respond_to do |format|
      format.html { redirect_to admin_stadiums_url, notice: 'Stadium успешно удален(о).' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stadium
      @stadium = Stadium.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stadium_params
      params.require(:stadium).permit(:name, :address, :phone, :description, :category_id)
    end
end

class Dashboard::PicturesController < DashboardController
  before_filter :find_picture, except: [ :index, :create ]
  before_filter :find_imageable

  def index
    @pictures = @imageable.pictures
  end

  def create
    @picture = @imageable.pictures.new name: params[:file]
    @imageable.save!

  end

  def destroy
    @picture.delete
  end

  private

  def find_imageable
    assoc = params[:imageable_type].underscore 
    @imageable = current_user.send assoc
  end

  def find_picture
    @picture = Picture.find(params[:id]) if params[:id]
  end
end
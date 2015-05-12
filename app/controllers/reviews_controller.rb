class ReviewsController < ApplicationController
  before_filter :find_review, except: :index
  before_action :authenticate_user!, except: :index

  def index
    @reviews = @record.reviews
    @review = Review.new
  end

  def create
    @review = @record.reviews.new review_params
    @review.user = current_user

    if @review.save  
      redirect_to :back, notice: 'Отзыв успешно добавлен'
    else
      render :index
    end
  end

  private
  def find_review
    @review = Review.find(params[:id]) if params[:id]
  end

  def review_params
    params.require(:review).permit(:text, :rating)
  end
end
class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save!
      redirect_to restaurant_path(@restaurant)
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @review = Review.new(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

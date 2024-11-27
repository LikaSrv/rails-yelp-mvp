class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    # @reviews = Review.where(restaurant_id: @restaurant.id)
    @reviews = @restaurant.reviews
  end
end

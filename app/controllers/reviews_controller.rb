# class ReviewsController < ApplicationController
#   # We need to find the restaurant associated with the review
#   before_action :set_restaurant, only: %i[new create]

#   def create
#     @review = Review.new(review_params)
#     @review.restaurant = @restaurant
#     @review.save
#     redirect_to restaurant_path(@restaurant)
#   end

#   private

#   def set_restaurant
#     @restaurant = Restaurant.find(params[:restaurant_id])
#   end

#   def review_params
#     params.require(:review).permit(:content)
#   end
# end

class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

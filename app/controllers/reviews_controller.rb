class ReviewsController < ApplicationController
  before_action :find_restaurant, except: [:destroy] #will not find restaurant that does not exist
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new #renders instance of new that failed to save (still in /reviews)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    redirect_to restaurant_path(@review.restaurant) #go back to restaurant
  end
  
  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

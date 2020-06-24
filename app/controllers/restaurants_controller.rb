class RestaurantsController < ApplicationController
  def index #all tasks 
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to task_path(@restaurant)
    end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy!
    redirect_to restaurants_path
  end

  def restaurant_params
    params.require(:task).permit(:name, :address, :category)
  end
  
  
end

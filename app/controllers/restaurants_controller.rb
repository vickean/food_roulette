class RestaurantsController < ApplicationController
  def index
    @restaurant= Restaurant.all 
  end

  def new
    @restaurant = Restaurant.new 
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save 
      redirect_to restaurant_path(@restaurant)
    else 
      flash[:warning] = "Invalid input"
      render :new
  end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
     @restaurant = Restaurant.find(params[:id])

     if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
     else 
     flash[:warning] = "Invalid input"
      render :edit
  end
end

  def destroy
     @restaurant = Restaurant.find(params[:id])
     @restaurant.destroy
     redirect_to restaurant_path
  end


  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :no_of_guest, :price_per_person,:address, :latitude,:longitude,:contact_number ,:price_tier,{photo:[]})
  end
end




class RestaurantsController < ApplicationController
  before_action :authorize_user, only: :index
  before_action :correct_user, only: [:show, :edit, :destroy]

  def index
  end

  def new
      @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      flash[:success] = "The listing is successfully created"
      redirect_to user_restaurant_path(current_user, @restaurant)
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
      redirect_to user_restaurant_path(current_user, @restaurant)
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

  def authorize_user
    if current_user.user_type == 2
      @restaurant = Restaurant.all
    elsif current_user == User.find(params[:user_id])
       @restaurant = Restaurant.where(user_id: params[:user_id])
    else
      flash[:warning] = "Unauthorization entry to the page"
      redirect_to root_path
    end
  end

  def correct_user
    unless current_user == User.find(params[:user_id]) || current_user.user_type == 2
      flash[:warning] = "Unauthorization changing the information"
      redirect_to root_path
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :no_of_guests, :price_per_person,:address, :latitude,:longitude,:contact_number ,:price_tier,{photo:[]})
  end
end

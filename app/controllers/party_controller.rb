class PartyController < ApplicationController
	before_action :find_party, only: [:show, :edit, :update, :destroy]

  def index
  	 # @user = User.find(params[:user_id])
     @party = @user.parties.all
  end

  def new
  	if current_user.spin_num == 0
  		redirect_to payment_path
  	else
			@party = Party.new
		end
  end

  def show
  end

  def edit
  end

  def create
  	lat = current_user.latitude
  	long = current_user.longitude
  	spin = current_user.find_by(spin_num: params[:spin_num])
  	date = current_user.find_by(date: params[:date])
  	@party = Party.new(params[:party_params])

  	if Party.check_party(lat, long, spin, date)
  		flash.now[:success] = 'Congratulations. The party is available'
    else
    	@party = Party.new(params:party_params)
      flash.now[:danger] = 'Sorry, there is no current party available at the area'
    end

  # @party = Party.all
  # 	if current_user.location == @party.location
  # 		if @party.price_tier == @user.spin_num && @party.date == @user.date
  # 			@existing_party = @party.find_by(date: params[:date])
  # 			redirect_to @existing_party
  # 		elsif @party.price_tier == @user.spin_num
  # 				@party = @party.find_by(price: params[:spin_num])
  # 				redirect_to @party
  # 				unless @party.nil?
	 #  				@party = Party.new(party_params)
		#   				if @party.save
  # 							@party.restaurant_id = @restaurant_id
  # 							@booking.user_id = current_user.id
  # 							@booking.party_id = @party.id
  # 							redirect_to booking_path()
  # 						else
  # 							flash[:warning] = "Unable to save"
  # 							redirect_to(:back)
  # 						end
  # 				end
  # 		elsif @party.date == @user.date
  # 			@party = @party.find_by(date: params[:date])
  # 			redirect_to @party
  # 				unless @party.nil?
	 #  				@party = Party.new(party_params)
		#   				if @party.save
  # 							@party.restaurant_id = @restaurant_id
  # 							@booking.user_id = current_user.id
  # 							@booking.party_id = @party.id
  # 							redirect_to booking_path()
  # 						else
  # 							flash[:warning] = "Unable to save"
  # 							redirect_to(:back)
  # 						end
  # 				end
  # 		else
  # 			flash[:warning] = "Unable to save"
  # 			redirect_to(:back)
  # 		end
  # 	elsif current_user.location != @party.location
  # 			@restaurant = Restaurant.all
  # 		if current_user.location == @restaurant.location
  # 			@new_restaurant = Restaurant.new(restaurant_params)
  # 			if @party.price_tier == @user.spin_num && @party.date == @user.date
  # 				redirect_to @party
  # 			else @party.price_tier == @user.spin_num || @party.date == @user.date
  # 				@party = Party.new(party_params)
  # 			end
  # 		else
  # 			flash[:warning] = "There is no restaurant available in the area"
  # 			redirect_to 'new'
  # 		end
  # 	else

  # 	end

  # 	@party.user_id = current_user.id

#check if the current user location has any party available
#if there is no party available, first find the nearby restaurant
#if there is nearby restaurant, then create a new party
#if both cases has parties available,
#check on user preferences on price and date with restaurant
#if match then push user_id and party_id into the booking table

  	# @restaurant = Restaurant.find(params[:id])
  	# @party.restaurant_id = @restaurant.id


  	# 	if @restaurant.price_tier == @user.spin_num && @restaurant.date == @user.date


  	# @restaurant.find_by(address: current_user.address)





  	# unless @reservation.uniqueness_of_date_range
   #    flash.now[:success] = 'Congratulations. The date is available'
   #  else
   #    flash.now[:danger] = 'Date is not available. Please choose another dates'
   #  end

  	# if @party.save
	  # 		party = @party.id
   #      flash[:success] = 'Congratulations. Your party has been secured successfully'
   #      redirect_to @party
   #    else
   #      flash[:danger] = 'Party unsuccesfully created'
   #      redirect_to(:back)
   #    end

  def update
    if @reservation.update(party_params)
      redirect_to party_path(@party)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @party.destroy
    redirect_to partys_path
  end

  def find_booking
    @party = Party.find(params[:party_id])
  end

	private
  def party_params
    params.require(:party).permit(:restaurant_id)
  end

  def location_range

  end
end
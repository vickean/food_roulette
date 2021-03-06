class PartiesController < ApplicationController
	before_action :find_party, only: [:show, :edit, :update, :destroy]

  def index
     @party = Party.all
  end

  def new
		@party = Party.new
  end

  def create

#check if the current user location has any party available
#if there is no party available, first find the nearby restaurant
#if there is nearby restaurant, then create a new party
#if both cases has parties available,
#check on user preferences on price and date with restaurant
#if match then push user_id and party_id into the booking table

  	lat = current_user.latitude
  	long = current_user.longitude
  	spin = current_user.spin_num
		# new_party = Party.new(party_params)
  	date = DateTime.now.to_date

  	if @party = Party.select_random_party(lat, long, spin, date)
			if @party.double_booked?(current_user)
				flash[:danger] = 'You are already booked into this party.'
			else
				@party.users << current_user
  			flash[:success] = 'Congratulations. The party is available'
			end
  		redirect_to @party

    elsif @restaurant = Restaurant.near([lat,long],1, order: false).affordable(spin).sample
    	@party = @restaurant.parties.create(number_of_people: 1, party_name: 'dolphin', datetime: date)
			@party.users << current_user

    	redirect_to @party
    else
      flash[:danger] = 'Sorry, there is no matching around your area'
      redirect_to '/'
    end
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

  def show
		@booking = Booking.new
  end

  def edit
  end

  def update
    if @party.update(party_params)
      redirect_to party_path(@party)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @party.destroy
    redirect_to partys_path
  end

  def find_party
    @party = Party.find(params[:id])
  end

	private
  # def party_params
  #   params.require(:party).permit(:restaurant_id)
  # end

  def location_range

  end
end

class BookingsController < ApplicationController
	def new
		@booking = Booking.new
	end

	def create
		@party = Party.find(params[:party_id])
		@booking = @party.bookings.new(user_id: current_user.id)
		@user = User.find(current_user.id)
		@num_token = @user.spin_num

		if @booking.save
			@user.spin_num = @num_token - 1
			@user.save
			redirect_to party_booking_path(:id => @booking.id, :party_id => @party.id)
		end

	end

	def show

		@booking = Booking.find(params[:id])
		@party = @booking.party
	end
end

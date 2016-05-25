class PartyController < ApplicationController
	before_action :find_party, only: [:show, :edit, :update, :destroy]

  def index
  	 @user = User.find(params[:user_id])
     @party = @user.partys.all
  end

  def new
  	@party = Party.new
  end

  def show
  end

  def edit
  end

  def create
  	@party = @user.partys.new(party_params)
  	@party.user_id = current_user.id

  	if current_user.spin_num


      if @reservation.save
        reservation1 = @reservation.id
         # ReservationMailer.booking_email(@customer, @host, @reservation1).deliver_later
        ReservationJob.perform_later(@customer, @host, reservation1)

        flash[:success] = 'Congratulations. Your reservation has been secured successfully'
        redirect_to @reservation
      else
        flash[:danger] = 'Reservation error'
        redirect_to(:back)
      end

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
    params.require(:party).permit(:restaurant_id, :)
  end
end
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passenger_number = params[:passenger_number]
    @passenger_number.to_i.times do
      @booking.passengers.build
    end
  end

  def create
    unless user_signed_in?
      user = create_new_user
      sign_in user
    end

    @booking = Booking.new(booking_params.merge(user_id: current_user.id))
    if @booking.save
      redirect_to booking_url(@booking), notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def create_new_user
    user = User.new(new_user_params[:user])
    render :new, status: :unprocessable_entity unless user.save
    user
  end

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_number,
                                    passengers_attributes: %i[id name])
  end

  def new_user_params
    params.require(:booking).permit(user: %i[name email password password_confirmation])
  end
end

class PassengersController < ApplicationController
  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passenger_url(@passenger), notice: 'Account created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @passenger = Passenger.find(params[:id])
  end

  private

  def passenger_params
    params.require(:flight).permit(:email, :password, :password_confirmation)
  end
end

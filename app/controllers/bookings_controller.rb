class BookingsController < ApplicationController
  def new
    @flights = Flight.find(params[:flight_id])
    @passengers = params[:passengers]
  end

  def create; end
end

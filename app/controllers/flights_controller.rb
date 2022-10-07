class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show edit update destroy]

  # GET /flights or /flights.json
  def index
    @flights = Flight.all
  end

  # GET /flights/1 or /flights/1.json
  def show; end

  # GET /flights/new
  def new
    @airport_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
    @airport_options = Airport.all.map { |airport| [airport.name, airport.id] }
  end

  # POST /flights or /flights.json
  def create
    @airport_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to flight_url(@flight), notice: 'Flight was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    @airport_options = Airport.all.map { |airport| [airport.name, airport.id] }
    if @flight.update(flight_params)
      redirect_to flight_url(@flight), notice: 'Flight was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy
    redirect_to flights_url, notice: 'Flight was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flight
    @flight = Flight.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.require(:flight).permit(:arrival_airport_id, :departure_airport_id, :departure_datetime, :arrival_datetime)
  end
end

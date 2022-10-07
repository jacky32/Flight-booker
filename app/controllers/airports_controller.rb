class AirportsController < ApplicationController
  before_action :set_airport, only: %i[show edit update destroy]

  # GET /airports or /airports.json
  def index
    @airports = Airport.all
  end

  # GET /airports/1 or /airports/1.json
  def show; end

  # GET /airports/new
  def new
    @airport = Airport.new
  end

  # GET /airports/1/edit
  def edit; end

  # POST /airports or /airports.json
  def create
    @airport = Airport.new(airport_params)

    if @airport.save
      redirect_to airport_url(@airport), notice: 'Airport was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /airports/1 or /airports/1.json
  def update
    if @airport.update(airport_params)
      redirect_to airport_url(@airport), notice: 'Airport was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /airports/1 or /airports/1.json
  def destroy
    @airport.destroy

    redirect_to airports_url, notice: 'Airport was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_airport
    @airport = Airport.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def airport_params
    params.require(:airport).permit(:name, :code)
  end
end

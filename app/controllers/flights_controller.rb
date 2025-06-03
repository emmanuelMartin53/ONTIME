require 'net/http'
require 'json'

class FlightsController < ApplicationController

  def fetch_flight_data(flight_number)
    keyAPI = "20240d4ae08ae4b955febb1985ebe89e"
    url = URI("https://api.aviationstack.com/v1/flights?access_key=#{keyAPI}&flight_iata=#{flight_number}")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    # Tu peux ici retourner par exemple le premier vol trouvé, ou nil si rien
    data["data"]&.first

    # {"flight_date"=>"2025-06-02", "flight_status"=>"landed",
    # "departure"=>{"airport"=>"Mérignac", "timezone"=>"Europe/Paris", "iata"=>"BOD", "icao"=>"LFBD", "terminal"=>"B", "gate"=>"22", "delay"=>13, "scheduled"=>"2025-06-02T18:40:00+00:00", "estimated"=>"2025-06-02T18:40:00+00:00", "actual"=>"2025-06-02T18:53:00+00:00", "estimated_runway"=>"2025-06-02T18:53:00+00:00", "actual_runway"=>"2025-06-02T18:53:00+00:00"},
    # "arrival"=>{"airport"=>"Charles De Gaulle", "timezone"=>"Europe/Paris", "iata"=>"CDG", "icao"=>"LFPG", "terminal"=>"2F", "gate"=>nil, "baggage"=>"24", "scheduled"=>"2025-06-02T20:00:00+00:00", "delay"=>nil, "estimated"=>"2025-06-02T19:50:00+00:00", "actual"=>nil, "estimated_runway"=>nil, "actual_runway"=>nil},
    # "airline"=>{"name"=>"Air France", "iata"=>"AF", "icao"=>"AFR"},
    # "flight"=>{"number"=>"7437", "iata"=>"AF7437", "icao"=>"AFR7437", "codeshared"=>nil},
    # "aircraft"=>{"registration"=>"F-HZUF", "iata"=>"BCS3", "icao"=>"BCS3", "icao24"=>"39E685"}, "live"=>nil}




  end

  def index
    @flights= Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
    @flight = Flight.new
  end

  def create
    flight_number = params[:flight][:flight_number]
    api_data = fetch_flight_data(flight_number)


    if api_data.present?
      @flight = Flight.new(
        user: current_user,
        flight_number: flight_number,
        airport: api_data["departure"]["airport"],
        terminal: api_data["departure"]["terminal"],
        destination: api_data["arrival"]["airport"],
        takeoff_time: api_data["departure"]["scheduled"],
        landing_time: api_data["arrival"]["scheduled"],
        user_departure_address: params[:flight][:user_departure_address],
        mobility_choice: params[:flight][:mobility_choice],
        arrival_time_wanted: params[:flight][:arrival_time_wanted]
      )
    else
      flash[:alert] = "Aucune donnée de vol trouvée pour ce numéro."
      redirect_to new_flight_path and return
    end

    if @flight.save
      redirect_to @flight, notice: "Vol ajouté avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
    redirect_to flights_path(@flights), status: :see_other
  end

  private

  def flight_params
    params.require(:flight).permit(:flight_number, :airport, :terminal, :destination,
                                   :takeoff_time, :landing_time, :user_departure_address, :mobility_choice)
  end


end

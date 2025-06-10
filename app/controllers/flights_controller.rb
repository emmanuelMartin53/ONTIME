require 'net/http'
require 'json'
require 'uri'
require 'open-uri'


class FlightsController < ApplicationController

  def index
    @flights= current_user.flights
    @flightsFutur = @flights.where('takeoff_time > ?', Time.current)
    @flightsDone = @flights.where('takeoff_time < ?', Time.current)
  end

  def show
    @flight = Flight.find(params[:id])
    @final_timing = final_time(@flight)
    @alert = Alert.new
    @alerts = Alert.from_airport_and_date(@flight.airport,@flight.takeoff_time)
    @hours = @flight.duration_second / 3600
    @minutes = (@flight.duration_second % 3600) / 60
  end

  def new
    @flight = Flight.new
  end

  def create
      flight_number = params[:flight][:flight_number]
      api_data = FlightData.new().fetch_flight_data(flight_number)
      duration_second_value = DurationTraject.new().duration_trajet(api_data["departure"]["airport"],params[:flight][:user_departure_address],params[:flight][:mobility_choice] )
      estimated_wait_value = EstimatedWait.new().estimated_wait(api_data["departure"]["iata"],Time.parse(api_data["departure"]["scheduled"]).strftime("%Y-%m-%d"),Time.parse(api_data["departure"]["scheduled"]).strftime("%H:%M"),api_data["departure"]["terminal"])

    #debugger
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
        arrival_time_wanted: params[:flight][:arrival_time_wanted],
        duration_second: duration_second_value,
        estimated_wait: estimated_wait_value,
        valise: params[:flight][:valise],
        international: params[:flight][:international],
        gate: api_data["departure"]["gate"]
      )
    else
      flash[:alert] = "Aucune donnée de vol trouvée pour ce numéro."
      redirect_to new_flight_path and return
    end

    if api_data["arrival"]["airport"] == "Charles De Gaulle"
      file = URI.parse('https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg').open
      @flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
    else
      file = URI.parse('https://static.seetheworld.com/image_uploader/photos/4a/original/bordeaux-merignac-airport-merignac.jpg').open
      @flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
    end

    if @flight.save
      user = @flight.user
      user.point +=10
      user.save
      redirect_to @flight, notice: "Vol ajouté , + 10pts"
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
                                   :takeoff_time, :landing_time, :user_departure_address,:arrival_time_wanted, :mobility_choice, :photo, :valise)

  end

  def time_string_to_minutes(decollage)
       hours, minutes = decollage.split(":").map(&:to_i)
      hours * 60 + minutes
  end

  def minutes_to_time_string(minutes)
    hours = minutes / 60
    mins = minutes % 60
    format("%02d:%02d", hours, mins)
  end

  def final_time(flight)
    # Facteur d'allongement des durées si vol international
    facteur_international = flight.international ? 1.5 : 1.0

    # Convertit l'heure de décollage en minutes depuis minuit
    heure_decollage_en_min = time_string_to_minutes(flight.takeoff_time.strftime("%H:%M"))

    fermeture_porte = 30
    affluence = flight.estimated_wait

    # Applique le facteur international aux durées variables
    temps_trajet = (flight.duration_second / 60.0) * facteur_international
    security = [ (10 + affluence * 2) * facteur_international, 90 ].min
    valise_marge = flight.valise ? [ (5 + affluence) * facteur_international, 20 ].min : 0

    avance_porte_souhaitee = flight.arrival_time_wanted

    # Calcul du timing total avant décollage
    timing_total = fermeture_porte + temps_trajet + security + valise_marge + avance_porte_souhaitee

    # Heure idéale de départ en minutes depuis minuit
    heure_depart_ideal = heure_decollage_en_min - timing_total

    # Ajuste si négatif (avant minuit)
    heure_depart_ideal += 24 * 60 if heure_depart_ideal < 0

    # Convertit les minutes en format HH:MM
    minutes_to_time_string(heure_depart_ideal)
  end
end


# http://api.aviationstack.com/v1/flights?access_key=20240d4ae08ae4b955febb1985ebe89e&dep_iata=BOD&flight_status=scheduled&date=2025-04-06&terminal=B

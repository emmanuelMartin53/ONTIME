class EstimatedWait


  def estimated_wait(iata, date, heure, terminal)
    api_key = ENV["AVIATION_STACK_API_KEY"]

    iata_encoded = URI.encode_www_form_component(iata)
    date_encoded = URI.encode_www_form_component(date)


    url = URI("http://api.aviationstack.com/v1/flights?access_key=#{api_key}&dep_iata=#{iata_encoded}&flight_status=scheduled&date=#{date_encoded}")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    flights = data["data"] || []  # selon la structure JSON de l'API, "data" contient la liste des vols
    target_hour = Time.parse(heure ).hour

    filtered_flights = flights.select do |flight|
      sched = flight.dig("departure", "scheduled")
      next false unless sched

      dt = Time.parse(sched)
      (dt.hour >= target_hour - 1) && (dt.hour < target_hour + 1)
    end

    filtered_flights_same_terminal = filtered_flights.select do |flight|
      flight["departure"]["terminal"] == terminal
    end
    filtered_flights_same_terminal.count
  end
end

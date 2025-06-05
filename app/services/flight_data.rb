class FlightData

  def fetch_flight_data(flight_number)
    api_key = ENV["AVIATION_STACK_API_KEY"]
    url = URI("https://api.aviationstack.com/v1/flights?access_key=#{api_key}&flight_iata=#{flight_number}")
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

end

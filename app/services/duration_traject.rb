class DurationTraject

 def duration_trajet(destination, origin, typeTransport)
    api_key = ENV["GOOGLE_API_KEY"]

    origins = URI.encode_www_form_component(origin)
    destinations = URI.encode_www_form_component("Aeroport #{destination}")
    mode = URI.encode_www_form_component(typeTransport)

    url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?destinations=#{destinations}&origins=#{origins}&mode=#{mode}&units=imperial&key=#{api_key}")

    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    duration_seconds = data["rows"][0]["elements"][0]["duration"]["value"]
    duration_seconds
  end

end

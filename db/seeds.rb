Alert.destroy_all
Flight.destroy_all
Task.destroy_all
User.destroy_all
Category.destroy_all

require "open-uri"

@user = User.new(email:"charlie@gmail.com", password:"ouioui", first_name:"Charlie" )
file = URI.parse('https://raw.githubusercontent.com/RubberDuckDebugging/rubberduckdebugging.github.io/master/images/rubberducky.png').open
@user.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@user.save
puts "user created"
@user = User.new(email:"test1@gmail.com", password:"ouioui", first_name:"test1" )
file = URI.parse('https://raw.githubusercontent.com/RubberDuckDebugging/rubberduckdebugging.github.io/master/images/rubberducky.png').open
@user.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@user.save
puts "user created"
@user = User.new(email:"test2@gmail.com", password:"ouioui", first_name:"test2" )
file = URI.parse('https://raw.githubusercontent.com/RubberDuckDebugging/rubberduckdebugging.github.io/master/images/rubberducky.png').open
@user.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@user.save
puts "user created"

administratif = Category.create!(name: "Administratif")
mavalise = Category.create!(name: "Ma valise")
avantdepartir = Category.create!(name: "Avant de partir")


@task = Task.new(user: User.last, content: "prendre des slips", category: mavalise)
@task.save!
@task = Task.new(user: User.last, content: "prendre des pulls", category: mavalise)
@task.save!
@task = Task.new(user: User.last, content: "prendre des chaussettes", category: mavalise)
@task.save!
@task = Task.new(user: User.last, content: "prendre des tshirts", category: mavalise)
@task.save!
puts"task created"


puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"AF7437", duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 16, 1, 45), landing_time:DateTime.new(2025, 6, 17, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice: 1, arrival_time_wanted:60,valise: true, international: true)

file = URI.parse('https://guide-voyage-tunisie.com/wp-content/uploads/2022/11/bab-bhar-tunis.webp').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")


@flight.save!
puts "Flight created"
puts "Starting flight creation"

@flight = Flight.new(user: User.find(2), flight_number:"SUI787",  duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "Charles de Gaule", takeoff_time:DateTime.new(2025, 6, 16, 1, 45), landing_time:DateTime.new(2025, 6, 17, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:60,valise: false, international: true)

file = URI.parse('https://guide-voyage-tunisie.com/wp-content/uploads/2022/11/bab-bhar-tunis.webp').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")

@flight.save!
puts "Flight created"
puts "Starting flight creation"

@flight = Flight.new(user: User.find(3) , flight_number:"VOE2410", duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 16, 1, 45), landing_time:DateTime.new(2025, 6, 17, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:60, valise: true, international: true)

file = URI.parse('https://guide-voyage-tunisie.com/wp-content/uploads/2022/11/bab-bhar-tunis.webp').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")

@flight.save!
puts "Flight created"




# VOE2431,  SUI787, VOE2410

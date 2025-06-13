Alert.destroy_all
Flight.destroy_all
Task.destroy_all
User.destroy_all
Category.destroy_all

require "open-uri"

@user = User.new(email:"iris@gmail.com", password:"ouioui", first_name:"Iris" )
file = URI.parse('https://ca.slack-edge.com/T02NE0241-U08N2TFLD44-6441cb5ca2fc-512').open
@user.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@user.save
puts "user created"
@user = User.new(email:"charlie@gmail.com", password:"ouioui", first_name:"Charlie" )
file = URI.parse('https://avatars.githubusercontent.com/u/117690497?v=4').open
@user.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@user.save
puts "user created"
@user = User.new(email:"manu@gmail.com", password:"yesyes", first_name:"Emmanuel" )
file = URI.parse('https://avatars.githubusercontent.com/u/83221976?u=0f44631161b4dee67ad75b7dd2d4c84e386d6c27&v=4&size=64').open
@user.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@user.save
puts "user created"

administratif = Category.create!(name: "Administratif")
mavalise = Category.create!(name: "Ma valise")
avantdepartir = Category.create!(name: "Avant de partir")


@task = Task.new(content: "Slips", category: mavalise, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Pulls", category: mavalise, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Chaussettes", category: mavalise, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "T-shirts", category: mavalise, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Chaussures de rando", category: mavalise, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Trousse de toilette", category: mavalise, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Brosse à dent", category: mavalise, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Papier d'identité", category: administratif, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Visa", category: administratif, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Vaccins", category: administratif, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Nourrir le chat", category: avantdepartir, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Couper l'arrivée d'eau", category: avantdepartir, taskable_type: "User", taskable_id: User.first.id)
@task.save!
@task = Task.new(content: "Déposer le courier", category: avantdepartir, taskable_type: "User", taskable_id: User.first.id)
@task.save!
puts"task created"



puts "Starting flight creation"

@flight = Flight.new(user: User.first , flight_number:"AF7345", duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "Tunis", takeoff_time:DateTime.new(2025, 7, 10, 1, 45), landing_time:DateTime.new(2025, 7, 10, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice: 1, arrival_time_wanted:60,valise: true, international: true, terminal: "B", gate:23)

file = URI.parse('https://guide-voyage-tunisie.com/wp-content/uploads/2022/11/bab-bhar-tunis.webp').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")

@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first, flight_number:"AF7435",  duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "Charles de Gaule", takeoff_time:DateTime.new(2025, 6, 9, 6, 45), landing_time:DateTime.new(2025, 6, 9, 8, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:60,valise: false, international: true,terminal: "B", gate:22)
file = URI.parse('https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first, flight_number:"AF7435",  duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "Charles de Gaule", takeoff_time:DateTime.new(2025, 6, 7, 1, 45), landing_time:DateTime.new(2025, 6, 7, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:60,valise: false, international: true,terminal: "B", gate:22)
file = URI.parse('https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first, flight_number:"AF7435",  duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "Charles de Gaule", takeoff_time:DateTime.new(2025, 6, 2, 1, 45), landing_time:DateTime.new(2025, 6, 2, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:60,valise: false, international: true,terminal: "B", gate:22)
file = URI.parse('https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first, flight_number:"AF7435",  duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "Charles de Gaule", takeoff_time:DateTime.new(2025, 5, 28, 1, 45), landing_time:DateTime.new(2025, 5, 28, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:60,valise: false, international: true,terminal: "B", gate:22)
file = URI.parse('https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg').open
@flight.photo.attach(io: file, filename: "photo-#{rand(300000000)}.png", content_type: "image/png")
@flight.save!
puts "Flight created"




# VOE2431,  SUI787, VOE2410

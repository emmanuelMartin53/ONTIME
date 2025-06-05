Flight.all.destroy_all
Task.all.destroy_all
User.all.destroy_all
Category.all.destroy_all

require "open-uri"

@user = User.new(email:"charlie@gmail.com", password:"ouioui", first_name:"Charlie" )
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
@flight = Flight.new(user: User.first , flight_number:"AF7437", duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 4, 1, 45), landing_time:DateTime.new(2025, 6, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice: 1, arrival_time_wanted:1)
@arrayTask = @flight.user.tasks.where(flight_id: nil)

p @arrayTask

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, category: task.category, flight: @flight)
end

@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"SUI787",  duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 11, 11, 1, 45), landing_time:DateTime.new(2025, 12, 12, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:2)
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, category: task.category, flight: @flight)
end

@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"VOE2410", duration_second: 1312, estimated_wait:2, airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 25, 1, 45), landing_time:DateTime.new(2025, 7, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:1, arrival_time_wanted:1)
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, category: task.category, flight: @flight)
end

@flight.save!
puts "Flight created"




# VOE2431,  SUI787, VOE2410

Flight.all.destroy_all
Task.all.destroy_all
User.all.destroy_all

@user = User.new(email:"charlie@gmail.com", password:"ouioui" )
@user.save
puts "user created"

@task = Task.new(user: User.last, content: "prendre des slips")
@task.save!
@task = Task.new(user: User.last, content: "prendre des pulls")
@task.save!
@task = Task.new(user: User.last, content: "prendre des chaussettes")
@task.save!
@task = Task.new(user: User.last, content: "prendre des tshirts")
@task.save!
puts"task created"


puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"AF7437", airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 4, 1, 45), landing_time:DateTime.new(2025, 6, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice: "car", arrival_time_wanted:1)
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, flight: @flight)
end

@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"SUI787", airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 4, 1, 45), landing_time:DateTime.new(2025, 6, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:"bus", arrival_time_wanted:2)
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, flight: @flight)
end

@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"VOE2410", airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 4, 1, 45), landing_time:DateTime.new(2025, 6, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles", mobility_choice:"foot", arrival_time_wanted:1)
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, flight: @flight)
end

@flight.save!
puts "Flight created"




# VOE2431,  SUI787, VOE2410

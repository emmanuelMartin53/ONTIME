Flight.all.destroy_all
Task.all.destroy_all


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
@flight = Flight.new(user: User.first , flight_number:"TU629", airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 4, 1, 45), landing_time:DateTime.new(2025, 6, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles")
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, flight: @flight)
end

@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"SUI787", airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 4, 1, 45), landing_time:DateTime.new(2025, 6, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles")
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, flight: @flight)
end

@flight.save!
puts "Flight created"

puts "Starting flight creation"
@flight = Flight.new(user: User.first , flight_number:"VOE2410", airport:"bordeaux", destination: "tunis", takeoff_time:DateTime.new(2025, 6, 4, 1, 45), landing_time:DateTime.new(2025, 6, 4, 6, 45), user_departure_address:"15 rue des doris 33130 Bègles")
@arrayTask = @flight.user.tasks.where(flight_id: nil)

@arrayTask.each do |task|
  puts task
  Task.create!(user: task.user, content: task.content, flight: @flight)
end

@flight.save!
puts "Flight created"




# VOE2431,  SUI787, VOE2410

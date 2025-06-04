class AddArrivalTimeWantedToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :arrival_time_wanted, :datetime
  end
end

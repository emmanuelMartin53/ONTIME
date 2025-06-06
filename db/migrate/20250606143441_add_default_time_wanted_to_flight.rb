class AddDefaultTimeWantedToFlight < ActiveRecord::Migration[7.1]
  def change
    change_column_default :flights, :arrival_time_wanted, from: nil, to: 0
  end
end

class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.references :user, null: false, foreign_key: true
      t.string :flight_number
      t.string :airport
      t.string :terminal
      t.string :destination
      t.datetime :takeoff_time
      t.datetime :landing_time
      t.string :user_departure_address
      t.timestamps
    end
  end
end

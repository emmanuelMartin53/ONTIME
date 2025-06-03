class AddEstimatedWaitToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :estimated_wait, :integer
  end
end

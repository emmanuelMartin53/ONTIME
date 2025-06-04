class AddValiseToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :valise, :boolean
  end
end

class AddMobilityChoiceToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :mobility_choice, :string
  end
end

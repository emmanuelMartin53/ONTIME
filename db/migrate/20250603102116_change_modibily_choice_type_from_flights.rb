class ChangeModibilyChoiceTypeFromFlights < ActiveRecord::Migration[7.1]
  def change
    remove_column :flights, :mobility_choice
    add_column :flights, :mobility_choice, :integer
end
end

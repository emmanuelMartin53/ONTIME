class AddGateToFlight < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :gate, :string
  end
end

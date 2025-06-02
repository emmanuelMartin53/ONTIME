class AddFlightToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :flight, foreign_key: true
  end
end

class AddFlightToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :flight, null: false, foreign_key: true
  end
end

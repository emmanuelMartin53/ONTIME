class AddDurationSecondToFlight < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :duration_second, :integer
  end
end

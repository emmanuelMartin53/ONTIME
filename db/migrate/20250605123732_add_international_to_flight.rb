class AddInternationalToFlight < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :international, :boolean
  end
end

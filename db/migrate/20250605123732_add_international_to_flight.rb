class AddInternationalToFlight < ActiveRecord::Migration[7.1]
  def change
    add_column_null :flights, :international, true
  end
end

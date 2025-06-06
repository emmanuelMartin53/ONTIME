class ChangeAttributeToAlert < ActiveRecord::Migration[7.1]
  def change
    change_column_null :alerts, :flight_id, true
  end
end

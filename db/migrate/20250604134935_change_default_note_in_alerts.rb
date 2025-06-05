class ChangeDefaultNoteInAlerts < ActiveRecord::Migration[7.1]
  def change
    change_column_default :alerts, :note, 2
  end
end

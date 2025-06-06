class ChangeAlertToVote < ActiveRecord::Migration[7.1]
  def change
    change_column_null :votes, :alert_id, true

  end
end

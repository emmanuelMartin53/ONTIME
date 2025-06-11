class ChangeDefaultDoneToTask < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :done, false
  end
end

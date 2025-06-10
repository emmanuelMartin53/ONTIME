class AsddtaskableToTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :flight_id
    remove_column :tasks, :user_id
    add_reference :tasks, :taskable, polymorphic: true
  end
end

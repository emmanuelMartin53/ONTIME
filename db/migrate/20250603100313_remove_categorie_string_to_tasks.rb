class RemoveCategorieStringToTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :categorie
  end
end

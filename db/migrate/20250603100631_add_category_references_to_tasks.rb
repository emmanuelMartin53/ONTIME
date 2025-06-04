class AddCategoryReferencesToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :category
  end
end

class AddCategorieToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :categorie, :string
  end
end

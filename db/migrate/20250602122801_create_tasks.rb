class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :done
      t.string :content
      t.timestamps
    end
  end
end

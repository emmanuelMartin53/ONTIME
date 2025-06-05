class CreateAlerts < ActiveRecord::Migration[7.1]
  def change
    create_table :alerts do |t|
      t.references :flight, null: false, foreign_key: true
      t.string :content
      t.integer :note, default: 0

      t.timestamps
    end
  end
end

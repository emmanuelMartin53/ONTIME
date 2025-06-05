class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :alert, null: false, foreign_key: true
      t.boolean :up

      t.timestamps
    end
  end
end

class CreateChirps < ActiveRecord::Migration[7.1]
  def change
    create_table :chirps do |t|
      t.references :user, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end

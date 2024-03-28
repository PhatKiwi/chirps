class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chirp, null: false, foreign_key: true

      t.index [:user_id, :chirp_id], unique: true

      t.timestamps
    end
  end
end

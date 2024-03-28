class AddUniqueConstraintToLikes < ActiveRecord::Migration[7.1]
  def change
    add_index :likes, [:user_id, :chirp_id], unique: true
  end
end

class AddLikesCountToChirps < ActiveRecord::Migration[7.1]
  def up
    add_column :chirps, :likes_count, :integer, null: false, default: 0

    Chirp.find_each do |chirp|
      chirp.update! likes_count: chirp.likes.size
    end

  end

  def down
    remove_column :chirps, :likes_count
  end
end

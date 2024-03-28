class Like < ApplicationRecord
  belongs_to :chirp, counter_cache: :likes_count
  belongs_to :user

  validates :user_id, uniqueness: { scope: :chirp_id }
end

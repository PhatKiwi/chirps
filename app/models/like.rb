class Like < ApplicationRecord
  belongs_to :chirp
  belongs_to :user

  validates :user_id, uniqueness: { scope: :chirp_id }
end

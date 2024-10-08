class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :chirps, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_chirps, through: :likes, source: :chirp
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_chirps, through: :bookmarks, source: :chirp

  validates :username, uniqueness: { case_sensitive: false}, allow_blank: true

  before_save :set_display_name, if: -> { username.present? && display_name.blank? }

  def set_display_name
    self.display_name = username.humanize
  end
end

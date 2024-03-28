class ChirpPresenter
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers

  def initialize(chirp:, current_user:)
    @chirp = chirp
    @current_user = user
  end

  attr_reader :chirp

  delegate :user, :body, :likes_count, to: :chirp
  delegate :display_name, :username, :avatar, to: :user

  def created_at
    if chirp.created_at < 1.day.ago
      chirp.created_at.strftime("%b %-d")
    else
      "#{time_ago_in_words(chirp.created_at)} ago"
    end
  end

  def like_chirp_url
    if chirp_liked_by_current_user?
      chirp_like_path(chirp, @current_user.likes.find_by(chirp: chirp))
    else
      chirp_likes_path(chirp)
    end
  end

  def turbo_data_method
    if chirp_liked_by_current_user?
      "delete"
    else
      "post"
    end
  end

  def like_heart_image
    if chirp_liked_by_current_user?
      "red-heart.png"
    else
      "heart.png"
    end
  end

  private

  def chirp_liked_by_current_user?
    @chirp_liked_by_current_user ||= chirp.liked_users.include?(@current_user)
  end
end

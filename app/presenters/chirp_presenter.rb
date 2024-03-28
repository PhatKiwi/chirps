class ChirpPresenter
  include ActionView::Helpers::DateHelper

  def initialize(chirp)
    @chirp = chirp
  end

  attr_reader :chirp

  delegate :user, :body, :likes, to: :chirp
  delegate :display_name, :username, :avatar, to: :user

  def created_at
    if chirp.created_at < 1.day.ago
      chirp.created_at.strftime("%b %-d")
    else
      "#{time_ago_in_words(chirp.created_at)} ago"
    end
  end
end

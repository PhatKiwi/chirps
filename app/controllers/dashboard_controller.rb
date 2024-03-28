class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @chirps = Chirp
                .includes(:liked_users, :bookmarked_users, :user)
                .order(created_at: :desc)
                .map { |chirp| ChirpPresenter.new(chirp: chirp, current_user: current_user) }
  end
end

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @chirps = Chirp
                .includes(:user)
                .order(created_at: :desc)
                .map { |chirp| ChirpPresenter.new(chirp) }
  end
end

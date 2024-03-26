class ChirpsController < ApplicationController
  before_action :authenticate_user!

  def create
    @chirp = Chirp.new(chirp_params.merge(user: current_user))

    if @chirp.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.turbo_stream
      end
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:body)
  end
end

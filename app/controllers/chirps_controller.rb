class ChirpsController < ApplicationController
  def create
    chirp = Chirp.new(chirp_params.merge(user: current_user))

    if chirp.save
      redirect_to root_path
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:body)
  end
end

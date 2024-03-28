class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.create(chirp: chirp)
    respond_to do |format|
      format.html { redirect_to dashboard_path }  #this is for specs only
      format.turbo_stream
    end
  end

  def destroy
    @like = chirp.likes.find(params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }  #this is for specs only
      format.turbo_stream
    end
  end

  private

  def chirp
    @chirp ||= Chirp.find(params[:chirp_id])
  end
end

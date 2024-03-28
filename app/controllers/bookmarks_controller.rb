class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @bookmark = current_user.bookmarks.create(chirp: chirp)
    respond_to do |format|
      format.html { redirect_to dashboard_path }  #this is for specs only
      format.turbo_stream
    end
  end

  def destroy
    @bookmark = chirp.bookmarks.find(params[:id])
    @bookmark.destroy
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

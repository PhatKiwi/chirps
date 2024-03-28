require "rails_helper"

RSpec.describe "Bookmarks", type: :request do
  let(:user) { create(:user) }
  let(:chirp) { create(:chirp, user: user)}

  before { sign_in user }

  describe "POST create" do
    it "creates a new bookmark" do
      expect do
        post chirp_bookmarks_path(chirp)
      end.to change { Bookmark.count }.by(1)

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE destroy" do
    it "deletes a bookmark" do
      bookmark = create(:bookmark, chirp: chirp, user: user)

      expect do
        delete chirp_bookmark_path(chirp, bookmark)
      end.to change { Bookmark.count }.by(-1)

      expect(response).to have_http_status(:redirect)
    end
  end
end

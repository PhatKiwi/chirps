require "rails_helper"

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:chirp) { create(:chirp, user: user)}

  before { sign_in user }

  describe "POST create" do
    it "creates a new like" do
      expect do
        post chirp_likes_path(chirp)
      end.to change { Like.count }.by(1)

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE destroy" do
    it "deletes a like" do
      like = create(:like, chirp: chirp, user: user)

      expect do
        delete chirp_like_path(chirp, like)
      end.to change { Like.count }.by(-1)

      expect(response).to have_http_status(:redirect)
    end
  end
end

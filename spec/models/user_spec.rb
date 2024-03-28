require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:chirps).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should have_many(:liked_chirps).through(:likes).source(:chirp) }
  it { should have_many(:bookmarks).dependent(:destroy) }
  it { should have_many(:bookmarked_chirps).through(:bookmarks).source(:chirp) }
  it { should validate_uniqueness_of(:username).case_insensitive.allow_blank }

  describe "#set_display_name" do
    context "when the display name is set" do
      it "does not change the display name" do
        user = build(:user, username: "phatkiwi", display_name: "me")
        user.save
        expect(user.reload.display_name).to eq("me")
      end
    end

    context "when the display name is not set" do
      it "humanizes the users username for display name" do
        user = build(:user, username: "phatkiwi", display_name: nil)
        user.save
        expect(user.reload.display_name).to eq("Phatkiwi")
      end
    end
  end
end

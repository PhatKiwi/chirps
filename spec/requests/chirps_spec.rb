require "rails_helper"

RSpec.describe "Chirps", type: :request do
  describe "POST create" do
    context "when not signed in" do
      it "is successful" do
        post chirps_url, params: {
          chirp: {
            body: "Hello World"
          }
        }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when signed in" do
      it "creates a new chirp" do
        user = create(:user)
        sign_in user

        expect do
          post chirps_url, params: {
            chirp: {
              body: "Hello World"
            }
          }
        end.to change { Chirp.count }.by(1)

        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end

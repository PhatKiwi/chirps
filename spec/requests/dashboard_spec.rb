require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  describe "GET /dashboard" do
    context "when not signed in" do
      it "is redirected" do
        get dashboard_path
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when signed in" do
      it "is successful" do
        user = create(:user)

        sign_in user
        get dashboard_path
        expect(response).to have_http_status(200)
      end
    end
  end
end

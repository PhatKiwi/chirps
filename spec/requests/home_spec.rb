require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    context "when not signed in" do
      it "is successful" do
        get root_path
        expect(response).to have_http_status(200)
      end
    end

    context "when signed in" do
      it "is redirect to dashboard" do
        user = create(:user)

        sign_in user
        get root_path
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end

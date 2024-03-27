require 'rails_helper'

RSpec.describe ChirpPresenter, type: :presenter do
  describe "#created_at" do
    context "when 24 hours have passed" do
      before do
        Timecop.freeze(Time.local(2023, 9, 1, 10, 5, 0))
      end

      after do
        Timecop.return
      end

      it "displays date format" do
        chirp = create(:chirp)
        chirp.update! created_at: 2.days.ago
        expect(ChirpPresenter.new(chirp).created_at).to eq("Aug 30")
      end
    end

    context "before 24 hours have passed" do
      it "displays time ago in words" do
        chirp = create(:chirp)
        expect(ChirpPresenter.new(chirp).created_at).to eq("less than a minute ago")
      end
    end
  end
end

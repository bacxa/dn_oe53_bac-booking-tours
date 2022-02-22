require 'rails_helper'

RSpec.describe  ToursController, type: :controller do
  describe "GET #show" do
    context "when tour exist" do
      let(:tour) {FactoryBot.create :tour}
      before{get :show, params: {id: tour}}

      it "returns a success response" do
        expect(response).to be_successful
      end

      it "assigns tour" do
        expect(assigns :tour).to eq tour
      end
    end

    context "when tour not found" do
      before{get :show, params: {id: 0}}

      it "redirect to tours path" do
        expect(response).to redirect_to root_path
      end

      it "show flash message" do
        expect(flash[:error]).to eq I18n.t("errors.tour_not_found")
      end
    end
  end
end

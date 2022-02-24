require "rails_helper"
include SessionsHelper

RSpec.describe Admin::ToursController, type: :controller do
  describe "GET/index" do
    context "when login as admin" do
      let!(:user) { FactoryBot.create(:user)}
      before do
        user = FactoryBot.create(:user, role: 1)
        log_in user
        get :index
      end

      it "render index view" do
        expect(response).to render_template("index")
      end
    end

    context "when not login as admin" do
      before do
        user = FactoryBot.create(:user)
        log_in user
        get :index
      end

      it "show message danger" do
        expect(flash[:danger]).to eq I18n.t("admin.tours.index.not_have_access")
      end

      it "redirect to root_path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when not login as user" do
      before do
        get :index
      end

      it "show message danger" do
        expect(flash[:danger]).to eq I18n.t("admin.tours.index.no_session")
      end

      it "redirect to root_path" do
        expect(response).to redirect_to(login_path)
      end
    end
  end
end

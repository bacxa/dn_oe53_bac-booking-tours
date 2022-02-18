require 'rails_helper'

RSpec.describe  UsersController, type: :controller do
  describe "GET new" do
    it "assigns a blank article to the view" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before do
        post :create, params: {user: FactoryBot.attributes_for(:user)}
      end

      it "create new contact" do
        expect(User.count).to eq(1)
      end

      it "show message if created successfully" do
        expect(controller).to set_flash[:success]
      end

      it "redirect_to root_url" do
        expect(response).to redirect_to root_url
      end
    end

    context "with invalid attributes" do
      before do
        post :create, params: {user: {name: "bac"}}
      end
      it "render template new if invalid " do
        expect(response).to render_template(:new)
      end
    end
  end
end

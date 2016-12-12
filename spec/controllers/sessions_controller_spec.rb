require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { create(:user) }
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "redirects to admin when post with right credentials" do
      post :create, params: { session: attributes_for(:user) }
      should redirect_to(users_url)
      expect(session[:user_id]).to eq(user.id)
      expect(flash[:notice]).to eq("Signed in successfully.")
    end
    it "renders the login form when post with wrong credentials" do
      post :create, params: { session: {email: "wrong@email.com", password: "bad"} }
      should render_template(:new)
      expect(flash[:danger]).to eq("Invalid email/password")
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      should redirect_to(login_url)
    end
  end

end

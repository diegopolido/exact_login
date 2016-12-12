require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:valid_attributes) { {
    name: "John",
    email: "john@doe.com",
    password: "Password",
    password_confirmation: "Password"
  } }

  let(:invalid_attributes) { {
    name: "John",
    email: "johndoe",
    password: "short",
    password_confirmation: "short"
  } }

  let(:valid_session) { {} }
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "creates a new User" do
      expect {
        post :create, params: {user: valid_attributes}, session: valid_session
      }.to change(User, :count).by(1)
    end
  end

end

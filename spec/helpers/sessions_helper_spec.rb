require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  
    before(:each) do
       @user =  User.create!(
          :name => "John",
          :email => "my@email.com",
          :password => "Password",
          :password_confirmation => "Password"
        )
    end
    it "should set the current user to session" do
      helper.log_in(@user)
      expect(session[:user_id]).to eq @user.id
    end    
    it "should return current user object" do
      session[:user_id] = @user.id
      expect(helper.current_user).not_to be_nil
      expect(helper.current_user.name).to eq @user.name
    end
end

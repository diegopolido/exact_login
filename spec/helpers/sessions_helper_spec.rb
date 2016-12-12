require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
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

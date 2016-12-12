require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    @user = User.new
  end  
  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
    assert_select "input#user_name[name=?]", "user[name]"
    assert_select "input#user_email[name=?]", "user[email]"
    assert_select "input#user_password[name=?]", "user[password]"
    assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"    
    end
  end
end

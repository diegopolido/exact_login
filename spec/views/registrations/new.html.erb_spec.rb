require 'rails_helper'

RSpec.describe "registrations/new.html.erb", type: :view do
  before(:each) do
    @user = User.new
  end  
  it "renders sign up form" do
    render

    assert_select "form[action=?][method=?]", signup_path, "post" do
    assert_select "input#user_name[name=?]", "user[name]"
    assert_select "input#user_email[name=?]", "user[email]"
    assert_select "input#user_password[name=?]", "user[password]"
    assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"    
    end
  end
end

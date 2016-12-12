require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "John Doe",
      :email => "john@doe.com",
      :password => "Password",
      :password_confirmation => "Password"
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end

require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "John",
        :email => "my@email.com",
        :password => "Password",
        :password_confirmation => "Password"
      ),
      User.create!(
        :name => "Doe",
        :email => "his@email.com",
        :password => "Password",
        :password_confirmation => "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    expect(rendered).to match /John/
    expect(rendered).to match /Doe/
  end
end

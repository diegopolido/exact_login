FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "john@doe.com"
    password "mypassword"
    password_confirmation "mypassword"    
  end
end

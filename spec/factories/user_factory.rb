FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
  	email
    password "1234567"
    first_name "Potato"
    last_name "Kartofel"
    admin false
  end
end
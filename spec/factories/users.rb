# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@email.com" }
    first_name 'Lydia'
    last_name 'Ho'
    password 'password'
    password_confirmation 'password'
  end
end

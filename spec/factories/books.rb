# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Is Everyone Hanging Out Without Me?#{n}" }
    author "Mindy Kaling"
  end
end

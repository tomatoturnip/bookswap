# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lend_book do
    book
    user
  end
end

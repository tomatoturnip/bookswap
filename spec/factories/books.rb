# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "Is Everyone Hanging Out Without Me?"
    author "Mindy Kaling"
  end

  factory :book2 do
    title "One More Thing"
    author "B.J. Novak"
  end
end

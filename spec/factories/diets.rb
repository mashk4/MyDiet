FactoryBot.define do
  factory :diet do
    name { Faker::Lorem.sentence }
    user
    meal_ids { [] }
    date { Date.today }
  end
end
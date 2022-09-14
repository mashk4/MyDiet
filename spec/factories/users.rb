FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { SecureRandom.hex(10) }

    trait :valid do
      email { "#{SecureRandom.hex(4)}@example.org" }
    end

    trait :invalid do
      email { 'abc+aaa.+@example.org' }
    end
  end
end
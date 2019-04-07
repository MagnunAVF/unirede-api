FactoryBot.define do
  factory :user do
    name          { Faker::Science.scientist }
    email         { Faker::Internet.free_email }
    password      { Faker::Internet.password(10) }
    access_level  { User.possible_access_levels.sample }
  end
end

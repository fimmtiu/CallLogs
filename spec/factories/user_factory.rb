FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name + " " + Faker::Name.last_name }
    email { Faker::Internet.email }
    password "whatever"
  end
end

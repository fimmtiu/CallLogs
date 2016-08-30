FactoryGirl.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    account_type { Customer::ACCOUNT_TYPES.sample }
  end
end

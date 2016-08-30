FactoryGirl.define do
  factory :log do
    user
    customer
    summary { Faker::Lorem.paragraph }
    duration { rand(1800) }
    created_at { 1.month.ago + rand(1.month.to_i) }
  end

end

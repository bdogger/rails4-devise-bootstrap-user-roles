FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    password { Faker::Internet.password }
    confirmed_at Time.now
  end
end
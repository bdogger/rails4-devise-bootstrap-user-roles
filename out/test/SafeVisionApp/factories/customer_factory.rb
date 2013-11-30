FactoryGirl.define do
  factory :customer do
    phone_number { Faker::PhoneNumber.phone_number }
    fax_number { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end

  factory :business_customer, parent: :customer do
    business_flag true
    business_name { Faker::Company.name }
  end

  factory :consumer_customer, parent: :customer do
    business_flag false
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
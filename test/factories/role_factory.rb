FactoryGirl.define do
  factory :role do
    name { Faker::Lorem.word }
    description { "#{Faker::Lorem.words(4)}" }
  end
end
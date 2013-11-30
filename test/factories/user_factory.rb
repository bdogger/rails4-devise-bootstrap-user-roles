FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
    password { Faker::Internet.password + '1231234' }
    confirmed_at Time.now
  end

  factory :admin_user, parent: :user do
    after(:create) do |user|
      user.roles << create(:role, name: 'employee')
      user.roles << create(:role, name: 'admin')
      user.save!
    end
  end
end
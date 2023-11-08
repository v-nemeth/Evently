FactoryBot.define do
  factory :user do
    # Define the attributes of the user here
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }

    trait :admin do
      admin { true }
    end
  end
end

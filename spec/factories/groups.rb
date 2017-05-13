 FactoryGirl.define do
    factory :group do
      name        Faker::Pokemon.location
      created_at  Faker::Time.between(2.days.ago, Time.now, :all)
    end
 end
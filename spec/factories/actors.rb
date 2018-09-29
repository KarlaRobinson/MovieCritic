FactoryBot.define do
  factory :actor do
    name { Faker::Name.name }
    role { Faker::Job.position }
  end
end
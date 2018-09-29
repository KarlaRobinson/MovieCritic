FactoryBot.define do
  factory :comment do
    subject { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
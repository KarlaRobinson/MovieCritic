FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    genre { %w(comedy drama international romcom horro suspense classic).sample }
    director { Faker::Name.name }
    prod_year { Faker::Number.between(1870, 2019) }
    rating { Faker::Number.between(1, 5) }
  end
end
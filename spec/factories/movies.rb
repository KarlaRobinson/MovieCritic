FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    genre { Movie.genre.sample }
    director { Faker::Name.name }
    prod_year { Faker::Number.between(1870, 2018) }
    rating { Faker::Number.between(1, 5) }
  end
end
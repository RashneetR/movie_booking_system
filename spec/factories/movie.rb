FactoryBot.define do
  factory :random_movie, class: Movie do
    name { Faker::Name.name }
    summary { Faker::Movie.quote }
    status { Faker::Number.between(0, 1) }
  end
end

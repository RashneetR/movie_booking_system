FactoryBot.define do
  factory :random_review, class: Review do
    comment { Faker::Movie.quote }
    rating { Faker::Number.between(1, 5) }
    movie_id factory: :random_movie
  end
end

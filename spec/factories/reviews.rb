FactoryBot.define do
  factory :random_review,class: Review do
       comment {Faker::Movie.quote}
       rating {Faker::Number.between(1,5)}
     end
end

FactoryBot.define do
  factory :random_show,class: Show do
       start_time {Faker::Time.between(DateTime.now, Date.today, :midnight)}
       end_time {Faker::Time.between(DateTime.now, Date.today, :midnight)}
       total_seats {Faker::Number.between(40,9200)}
       num_seats_sold {Faker::Number.between(40,400)}
       cost_per_seat {Faker::Number.between(80,1500)}
       #association :followed_by_movie, factory: :movie, id: "1"
     end
end

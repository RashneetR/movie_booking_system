FactoryBot.define do
  factory :random_ticket,class: Ticket do
       num_seats_bought {Faker::Number.between(40,400)}
       total_cost {Faker::Number.between(80,1500)}
  end
end

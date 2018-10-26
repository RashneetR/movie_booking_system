FactoryBot.define do

  factory :random_theatre,class: Theatre do
    name {Faker::Name.name}
    
  end
end

FactoryBot.define do
  factory :random_user,class: User do
       name {Faker::Name.name}
       encrypted_password {Faker::Internet.password(6, 30)}
       role {Faker::Number.between(0,2)}
       email {Faker::Internet.email}
     end
end

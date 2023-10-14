FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"testtest567"}
    password_confirmation {password}
  end
end

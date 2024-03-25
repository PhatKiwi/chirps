FactoryBot.define do
  factory :user do
    email { "admin@admin.com" }
    password { "password" }
    username { Faker::FunnyName.name }
  end
end

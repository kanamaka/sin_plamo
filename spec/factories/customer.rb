FactoryBot.define do
 factory :customer do
  email { Faker::Internet.email }
  name { 12345678909 }
  password { '123456' }
  # password_confirmation { '123456' }
 end
end
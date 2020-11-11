FactoryBot.define do
  factory :user do
  	name { "a" }
  	email { "user@demo" }
  	password { 'password' }
    password_confirmation { 'password' }
  end
end
require 'faker'
FactoryBot.define do
  factory :user do
    name                        {Faker::Name.name }
    email                       {Faker::Internet.email }
    password                    {'akshat123'} 
    role                        {'admin'}
    created_at                  { Time.now }
    updated_at                  { Time.now }
  end
end
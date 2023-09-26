require 'faker'
FactoryBot.define do
    factory :user do
        sequence(:name)             { |n| "User #{n}" }
        email                       {Faker::Internet.email }
        password                    { 'akshat123'} 
        role                        {'sub_admin'}
        created_at                  { Time.now }
        updated_at                  { Time.now }
    end
end
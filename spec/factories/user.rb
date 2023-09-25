FactoryBot.define do
    factory :user do
        sequence(:name)   { |n| "User #{n}" }
        email            { "john121#{n}@gmail.com" }
        password         { 'akshat123'} 
        role             {'admin'}
        created_at       { Time.now }
        updated_at       { Time.now }
    end
end
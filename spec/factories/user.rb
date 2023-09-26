FactoryBot.define do
    factory :user do
        sequence(:name)             { |n| "User #{n}" }
        sequence(:email)            { |n|"john1#{n}1@gmail.com"}
        password                    { 'akshat123'} 
        role                        {'sub_admin'}
        created_at                  { Time.now }
        updated_at                  { Time.now }
    end
end
# FactoryBot.define do
#     factory :review do
        
#     end
    
#     factory :appointment do
        
#     end
    
#     factory :user do
#         sequence(:name)   { |n| "User #{n}" }
#         email            { 'john@email_provider.com' }
#         password         { 'akshat123'} 
#         role             {'admin'}
#         created_at       { Time.now }
#         updated_at       { Time.now }
#     end
#     factory :hospital do
#         sequence(:name)   { |n| "Hospital #{n}" }
#         sequence(:Location)   {|n| "Location #{n}" }
#         sequence(:user_id)       { |n| n }
#         created_at        { Time.now }
#         updated_at        { Time.now }
#     end
# end
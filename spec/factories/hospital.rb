FactoryBot.define do
  factory :hospital do
    sequence(:name)               {|n| "Hospital #{n}" }
    sequence(:location)                   { |n| "Location #{n}"}
    user_id                      { FactoryBot.create(:user).id }
    created_at                   { Time.now }
    updated_at                   { Time.now }
  end
end
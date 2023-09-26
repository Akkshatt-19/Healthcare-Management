FactoryBot.define do
  factory :appointment do
    sequence(:user_id)          { (FactoryBot.create(:user)).id }
    sequence(:description)        { |n| "Disease #{n}" }
    sequence(:hospital_id)        { FactoryBot.create(:hospital).id }
    sequence(:test_center_id)     { FactoryBot.create(:test_center).id }
    status                        {'pending'}
    created_at                    { Time.now }
    updated_at                    { Time.now }
  end
end

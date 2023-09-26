FactoryBot.define do
  factory :appointment do
    user_id        { FactoryBot.create(:user).id }
    sequence(:description)        { |n| "Disease #{n}" }
    hospital_id     { FactoryBot.create(:hospital).id }
    test_center_id    { FactoryBot.create(:test_center).id }
    status                        {'pending'}
    created_at                    { Time.now }
    updated_at                    { Time.now }
  end
end

FactoryBot.define do
  factory :test_center do
    sequence(:name)             { |n| "Test Center #{n}" }
    sequence(:hospital_id)      {(FactoryBot.create(:hospital)).id}
    sequence(:location)         {|n| "Location #{n}" }
    created_at                  { Time.now }
    updated_at                  { Time.now }
  end
end
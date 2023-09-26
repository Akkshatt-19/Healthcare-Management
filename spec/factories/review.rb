FactoryBot.define do
    factory :review do
      user_id                { FactoryBot.create(:user).id }
      association :reviewable, factory: :hospital || :test_center
      reviewable_type        {reviewable.class.to_s}
      sequence(:feedback)    {|n|"Feedback #{n}"}
      created_at             { Time.now }
      updated_at             { Time.now }
    end
  end

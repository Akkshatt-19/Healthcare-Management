FactoryBot.define do
    factory :review do
      user_id                { FactoryBot.create(:user).id }
      reviewable_id          { FactoryBot.create(:hospital).id }
      reviewable_type        {"Hospital"}
      sequence(feedback)     {|n|"Feedback #{n}"}
      created_at             { Time.now }
      updated_at             { Time.now }
    end
  end

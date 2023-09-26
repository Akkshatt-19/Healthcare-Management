require "rails_helper"

RSpec.describe Review, type: :model do

  before(:all) do
    @review = FactoryBot.create(:review)
  end

  after(:all) do
    @review.destroy
  end

  it "is valid with valid attributes" do
    expect(@review).to be_valid
  end

  it "is not valid without user_id" do
    @review.user_id = nil
    expect(@review).to_not be_valid
  end

  it "is not valid without reviewable_id" do
    @review.reviewable_id = nil
    expect(@review).to_not be_valid
  end

  it "is not valid without reviewable_type" do
    @review.reviewable_type = nil
    expect(@review).to_not be_valid
  end

  it "is not valid without feedback" do
    @review.feedback = nil
    expect(@review).to_not be_valid
  end
end

# RSpec.describe User, type: :model do
#   describe "Associations" do
#     it { should have_many(:hospitals) }
#     it { should have_many(:test_centers).through(:hospitals) }
#     it { should have_many(:reviews) }
#     it { should have_many(:appointments) }
#   end
# end
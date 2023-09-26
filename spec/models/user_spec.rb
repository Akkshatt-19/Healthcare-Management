require "rails_helper"

RSpec.describe User, type: :model do

  before(:all) do
    @user = FactoryBot.create(:user)
  end

  after(:all) do
    @user.destroy
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid without a role" do
    @user.role = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it "is not valid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end
  it "is not valid without a password_digest" do
    @user.password_digest = nil
    expect(@user).to_not be_valid
  end

  it "is not valid with an invalid email format" do
    @user.email = 'invalid-email'
    expect(@user).to_not be_valid
  end
  
  it "should have many hospitals" do
    t = User.reflect_on_association(:hospitals)
    expect(t.macro).to eq(:has_many)
  end
  it "should have_many test_centers through hospitals" do
    t = User.reflect_on_association(:test_centers)
    expect(t.macro).to eq(:has_many)
  end
  it "should have_many reviews" do
    t = User.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end
  it "should have_many appointments" do
    t = User.reflect_on_association(:appointments)
    expect(t.macro).to eq(:has_many)
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
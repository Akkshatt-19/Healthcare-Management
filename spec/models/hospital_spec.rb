require 'rails_helper'

RSpec.describe Hospital, :type => :model do

  before(:all) do
    @hospital = FactoryBot.create(:hospital)
  end

  after(:all) do
    @hospital.destroy
  end

  it "should belongs to user" do
    t = Hospital.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should have_many test_centers" do
    t = Hospital.reflect_on_association(:test_centers)
    expect(t.macro).to eq(:has_many)
  end
  it "should have_many reviews" do
    t = Hospital.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end
  
  it "is valid with valid attributes" do
    expect(@hospital).to be_valid
  end
  
  it "is not valid without a name" do
    @hospital.name = nil
    expect(@hospital).to_not be_valid
  end
  
  it "is not valid without an location" do
    @hospital.location = nil
    expect(@hospital).to_not be_valid
  end
  
  it "is not valid without a user id" do
    @hospital.user_id = nil
    expect(@hospital).to_not be_valid
  end
end

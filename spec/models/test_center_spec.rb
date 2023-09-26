require 'rails_helper'

RSpec.describe TestCenter, type: :model do

  before(:all) do
    @testing = FactoryBot.create(:test_center)
  end

  after(:all) do
    @testing.destroy
  end
  
  it "is valid with valid attributes" do
    expect(@testing).to be_valid
  end
  
  it "is not valid without a name" do
    @testing.name = nil
    expect(@testing).to_not be_valid
  end
  
  it "is not valid without location" do
    @testing.location = nil
    expect(@testing).to_not be_valid
  end
  it "is not valid without hospital_id" do
    @testing.hospital_id = nil
    expect(@testing).to_not be_valid
  end

  it "should belongs to hospital" do
    t = TestCenter.reflect_on_association(:hospital)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should have_many appointments" do
    t = TestCenter.reflect_on_association(:appointments)
    expect(t.macro).to eq(:has_many)
  end
  it "should have_many reviews" do
    t = TestCenter.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end
end
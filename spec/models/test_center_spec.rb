require 'rails_helper'

RSpec.describe TestCenter, type: :model do
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
  
  it "is valid with valid attributes" do
    testing = FactoryBot.create(:test_center)
    expect(testing).to be_valid
  end
  
  it "is not valid without a name" do
    testing = FactoryBot.create(:test_center)
    testing.name = nil
    expect(testing).to_not be_valid
  end
  
  it "is not valid without location" do
    testing = FactoryBot.create(:test_center)
    testing.location = nil
    expect(testing).to_not be_valid
  end
  it "is not valid without hospital_id" do
    testing = FactoryBot.create(:test_center)
    testing.hospital_id = nil
    expect(testing).to_not be_valid
  end
end
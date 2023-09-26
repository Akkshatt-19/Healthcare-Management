require 'rails_helper'

RSpec.describe Hospital, :type => :model do
  
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
    hospital = FactoryBot.create(:hospital)
    expect(hospital).to be_valid
  end
  
  it "is not valid without a name" do
    hospital = FactoryBot.create(:hospital)
    hospital.name = nil
    expect(hospital).to_not be_valid
  end
  
  it "is not valid without an location" do
    hospital = FactoryBot.create(:hospital)
    hospital.location = nil
    expect(hospital).to_not be_valid
  end
  
  it "is not valid without a user id" do
    hospital = FactoryBot.create(:hospital)
    hospital.user_id = nil
    expect(hospital).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before(:all) do
    @appointment = FactoryBot.create(:appointment)
  end

  after(:all) do
    @appointment.destroy
  end
  it "should belongs to User" do
    t = Appointment.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should belongs to Hospital" do
    t = Appointment.reflect_on_association(:hospital)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should have_many TestCenter" do
    t = Appointment.reflect_on_association(:test_center)
    expect(t.macro).to eq(:belongs_to)
  end
  
  it "is valid with valid attributes" do
    expect(@appointment).to be_valid
  end
  
  it "is not valid without status" do
    @appointment.status = nil
    expect(@appointment).to_not be_valid
  end
  
  it "is not valid without a description" do
    @appointment.description = nil
    expect(@appointment).to_not be_valid
  end
  
  it "is not valid without an user_id" do
    @appointment.user_id = nil
    expect(@appointment).to_not be_valid
  end
  
  it "is not valid without an test_center_id" do
    @appointment.test_center_id = nil
    expect(@appointment).to_not be_valid
  end
  
  it "is not valid without an hospital_id" do
    @appointment.hospital_id = nil
    expect(@appointment).to_not be_valid
  end
end
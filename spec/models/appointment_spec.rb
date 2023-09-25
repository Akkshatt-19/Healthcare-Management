require 'rails_helper'

RSpec.describe Appointment, type: :model do
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
end
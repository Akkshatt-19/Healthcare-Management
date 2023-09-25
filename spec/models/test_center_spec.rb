require 'rails_helper'

describe TestCenter do
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
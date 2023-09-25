require 'rails_helper'


describe Hospital do
  it "should belongs to user" do
    t = Hospital.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should have_many test_centers" do
    t = Hospital.reflect_on_association(:test_centers)
    expect(t.macro).to eq(:has_many)
  end
  it "should have_many reviews" do
    FactoryBot.create(:hospital)
    t = Hospital.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end
end


# RSpec.describe Hospital, :type => :model do
# end

# it "is not valid without a name" do
#   hospital = Hospital.new(
#     location: "Scheme no. 78",
#     user_id: 1
#   )
#   expect(hospital).to be_valid
# end
# it "is not valid without an location" do
#   hospital = Hospital.new(
#     name: "Apollo Hospital",
#     user_id: 1
#   )
#   expect(hospital).to be_valid
# end
# it "is not valid without a user id" do
#   hospital = Hospital.new(
#     name: "Apollo Hospital",
#     location: "Scheme no. 78",
#     user_id: 1
#   )
#   expect(hospital).to be_valid
# end
# it "is not valid with user id other than admin" do
#   hospital = Hospital.new(
#     name: "Apollo Hospital",
#     location: "Scheme no. 78",
#     user_id: 5
#   )
#   expect(hospital).to be_valid
# end

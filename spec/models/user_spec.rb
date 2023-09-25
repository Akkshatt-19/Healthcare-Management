require "rails_helper"

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    user = User.new(
      name: "Akshat Pegwar",
      email: "akshatp@shriffle.com",
      password_digest: "password",
      role: "admin"
    )
    expect(user).to be_valid
  end

  it "is not valid without a role" do
    user = User.new(
      name: "Akshat Pegwar",
      email: "akshatp@shriffle.com",
      password_digest: "password"
    )
    expect(user).to_not be_valid
  end

  it "is not valid without a name" do
    user = User.new(
      email: "akshatp@shriffle.com",
      password_digest: "password",
      role: "admin"
    )
    expect(user).to_not be_valid
  end
  it "is not valid without an email" do
    user = User.new(
      name: "Akshat Pegwar",
      password_digest: "password",
      role: "admin"
    )
    expect(user).to_not be_valid
  end
  it "is not valid without a password_digest" do
    user = User.new(
      name: "Akshat Pegwar",
      email: "akshatp@shriffle.com",
      role: "admin"
    )
    expect(user).to_not be_valid
  end
  
  it "is valid with a reset_password_token and reset_password_sent_at" do
    user = User.new(
      name: "Akshat Pegwar",
      email: "akshatp@shriffle.com",
      password_digest: "password",
      role: "admin",
      reset_password_token: "abcd1234",
      reset_password_sent_at: Time.now
    )
    expect(user).to be_valid
  end
  it "is valid with a valid email format" do
    user = User.new(
      name: "Akshat Pegwar",
      email: "akshatp@shriffle.com",
      password_digest: "password",
      role: "admin"
    )
    expect(user).to be_valid
  end
  it "is not valid with an invalid email format" do
    user = User.new(
      name: "Akshat Pegwar",
      email: "invalid-email",
      password_digest: "password",
      role: "admin"
    )
    expect(user).to_not be_valid
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
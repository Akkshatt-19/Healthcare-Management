class Hospital < ApplicationRecord
  belongs_to :user
  has_many :test_centers

  validates :name, presence: true, length: { maximum: 30 }
  validates :location, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
end

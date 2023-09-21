class Hospital < ApplicationRecord
  belongs_to :user
  has_many :test_centers
  has_one_attached :image
  
  has_many :reviews, as: :reviewable
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :location, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
  
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "name", "test_centers_id", "updated_at", "user_id"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "reviews", "test_centers", "user"]
  end
  
end

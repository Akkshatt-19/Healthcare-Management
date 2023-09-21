class TestCenter < ApplicationRecord
  belongs_to :hospital
  has_many :appointments
  has_one_attached :image
  
  has_many :reviews, as: :reviewable
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :hospital_id, presence: true
  validates :location, presence: true, length: { maximum: 250 }
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "hospital_id", "id", "location", "name", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["appointments", "hospital", "image_attachment", "image_blob", "reviews"]
  end
end

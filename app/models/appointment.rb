class Appointment < ApplicationRecord
  enum status: { pending: 'pending', scheduled: 'scheduled', completed: 'completed' }
  belongs_to :user
  belongs_to :hospital
  belongs_to :test_center
  has_one_attached :image
  
  validates :user_id, presence: true
  validates :hospital_id, presence: true
  validates :test_center_id, presence: true
  validates :status, inclusion: { in: ['pending', 'scheduled', 'completed'] }
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "hospital_id", "id", "status", "test_center_id", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["hospital", "image_attachment", "image_blob", "test_center", "user"]
  end
  
end

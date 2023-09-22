class User < ApplicationRecord
  has_secure_password
  enum role: { admin: 'admin', sub_admin: 'sub_admin', health_worker: 'health_worker', patient: 'patient' }
  has_one_attached :image
  
  has_many :hospitals
  has_many :test_centers , through: :hospitals
  has_many :appointments

  has_many :reviews
  
  after_create :user_logged_in
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, inclusion: { in: ['admin', 'sub_admin','health_worker','patient'] }
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "password_digest", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
  
  
  def self.ransackable_associations(auth_object = nil)
    ["appointments", "hospitals", "image_attachment", "image_blob", "reviews", "test_centers"]
  end
  
  
  def user_logged_in
    UserMailer.user_created(self).deliver_now
  end
  
  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end
  
  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end
  
  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end
  
  private
  
  def generate_token
    SecureRandom.hex(3)
  end
  
end

class TestCenter < ApplicationRecord
  belongs_to :hospital
  has_many :appointments

  validates :name, presence: true, length: { maximum: 100 }
  validates :hospital_id, presence: true
  validates :location, presence: true, length: { maximum: 250 }

end

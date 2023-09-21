class Review < ApplicationRecord
    belongs_to :reviewable, polymorphic: true
    belongs_to :user
    validates :feedback, presence: true, length: { maximum: 250 }
    
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "feedback", "id", "reviewable_id", "reviewable_type", "updated_at", "user_id"]
    end
end

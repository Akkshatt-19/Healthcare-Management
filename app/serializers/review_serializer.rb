class ReviewSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:reviewable_id,:reviewable_type,:feedback
end

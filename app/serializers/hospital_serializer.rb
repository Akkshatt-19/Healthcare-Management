class HospitalSerializer < ActiveModel::Serializer
  attributes :id,:name,:location,:user_id
end

class PhotographerSerializer < ActiveModel::Serializer
  attributes :id, :username, :icon, :role, :appointments
end

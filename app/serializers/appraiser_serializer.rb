class AppraiserSerializer < ActiveModel::Serializer
  attributes :id, :username, :icon, :role, :appointments
end

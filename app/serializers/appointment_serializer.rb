class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :description

  belongs_to :field_worker
  belongs_to :location
end

class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :status, :description

  belongs_to :location, serializer: LocationSerializer
  belongs_to :field_worker, serializer: FieldWorkerSerializer
end

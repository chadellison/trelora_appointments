class FieldWorkerSerializer < ActiveModel::Serializer
  attributes :id, :username, :icon, :role, :appointments

  def appointments
    object.appointments.map do |appointment|
      { info: appointment, location: appointment.location}
    end
  end
end

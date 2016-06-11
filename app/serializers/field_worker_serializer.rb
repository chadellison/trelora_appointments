class FieldWorkerSerializer < ActiveModel::Serializer
  attributes :id, :username, :icon, :role, :appointments

  def appointments
    object.appointments.map do |appointment|
      {appointment_info: appointment, location: appointment.location}
    end
  end
end

class FieldWorkerSerializer < ActiveModel::Serializer
  attributes :id, :username, :icon, :role, :appointments

  def appointments
    object.appointments.filter_by_day.map do |appointment|
      { info: appointment, location: appointment.location}
    end
  end

end

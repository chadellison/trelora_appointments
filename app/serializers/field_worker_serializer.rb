class FieldWorkerSerializer < ActiveModel::Serializer
  attributes :id, :username, :icon, :role, :appointments

  def appointments
    instance_options[:day] ? day = instance_options[:day] : day = Date.today.to_datetime
    object.appointments.filter_by_day(day).map do |appointment|
      { info: appointment, location: appointment.location}
    end
  end
end

class Api::V1::AppointmentsController < Api::ApiController
  respond_to :json

  def best_appointment
    appointment = Appointment.best_appointment(params)
    respond_with appointment
  end

  def url_best_day
    location = Location.find_or_create_by(address: params[:markerAddress])
    appointment = Appointment.best_appointment(params)
    locations = [location,appointment,appointment.field_worker, appointment.location] if appointment
    respond_with locations
  end

end

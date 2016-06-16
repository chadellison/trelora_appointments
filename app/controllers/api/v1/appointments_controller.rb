class Api::V1::AppointmentsController < Api::ApiController
  respond_to :json

  def best_appointment
    appointment = Appointment.best_appointment(params)
    respond_with appointment
  end

  def url_best_day
    location = Location.find_or_create_by(address: params[:markerAddress])
    appointment = Appointment.best_appointment(params)
    if appointment
      locations = [location,appointment,appointment.field_worker, appointment.location]
    else
      # binding.pry
      locations = [location]
    end
    respond_with locations
  end
end

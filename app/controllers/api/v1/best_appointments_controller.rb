class Api::V1::BestAppointmentsController < Api::ApiController
  respond_to :json

  def show
    location = Location.find_or_create_by(address: params[:markerAddress])
    appointment = Appointment.best_appointment(params)
    if appointment
      locations = [location,appointment,appointment.field_worker, appointment.location]
    else
      locations = [location]
    end
    respond_with locations
  end
end

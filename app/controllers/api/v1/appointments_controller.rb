class Api::V1::AppointmentsController < Api::ApiController
  respond_to :json

  def best_appointment
    appointment = Appointment.best_appointment(params)
    respond_with appointment
  end

end

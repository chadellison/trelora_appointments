class Api::V1::AppointmentsController < Api::ApiController
  respond_to :json

  def index
    @appointments = Appointment.all
    respond_with @appointments
  end

  def show

  end

end

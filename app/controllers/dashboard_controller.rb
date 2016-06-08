class DashboardController < ApplicationController

  def index
    # @appointments = Appointment.all
    # @destinations = ["Colorado Springs, CO", "Boulder, CO"]
    @something = GoogleMaps.new.service
  end

end

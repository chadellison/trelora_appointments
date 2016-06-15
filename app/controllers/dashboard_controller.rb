class DashboardController < ApplicationController
  def index
    GoogleCalendarService.new.store_events
    @address = Location.create(address: params[:address])
    @date = params[:date]
    @role = params[:role]
  end
end

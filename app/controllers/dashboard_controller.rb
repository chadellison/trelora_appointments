class DashboardController < ApplicationController
  def index
    GoogleCalendarService.new.store_events
    @address = params[:address]
    @date = params[:date]
    @role = params[:role]
  end
end

class DashboardController < ApplicationController
  respond_to :json, :html

  def index
    GoogleCalendarService.new.events_hash
  end

  def calendar
    respond_with GoogleCalendarService.new.events_hash
  end
end

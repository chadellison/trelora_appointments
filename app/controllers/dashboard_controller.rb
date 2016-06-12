class DashboardController < ApplicationController
  def index
    GoogleCalendarService.new.store_events
  end
end

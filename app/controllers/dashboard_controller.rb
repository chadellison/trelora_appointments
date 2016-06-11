class DashboardController < ApplicationController
  def index
    a = GoogleCalendarService.new.store_events
  end
end

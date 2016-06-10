class DashboardController < ApplicationController
  def index
    a = GoogleCalendarService.new.store_events
    # binding.pry
  end
end

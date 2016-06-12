class DashboardController < ApplicationController
  def index
    @user = User.new
    @field_worker = FieldWorker.new
    GoogleCalendarService.new.store_events
  end
end

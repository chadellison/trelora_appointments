require "rails_helper"

RSpec.describe GoogleCalendarService do
  it "It returns events on a calendar" do
    GoogleCalendarService.new.store_events
    expect(Appointment.count).to eq 2
    expect(Appointment.last.description).to eq "summary"
  end
end

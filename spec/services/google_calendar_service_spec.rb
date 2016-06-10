require "rails_helper"

RSpec.describe GoogleCalendarService do
  it "It returns events on a calendar" do
    service = GoogleCalendarService.new
    expect(service.store_events.count).to eq 2
    expect(service.store_events.last.summary).to eq "summary"
  end
end

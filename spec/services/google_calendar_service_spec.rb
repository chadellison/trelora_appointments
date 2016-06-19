require "rails_helper"

RSpec.describe GoogleCalendarService do
  VCR.use_cassette("store_events#google_calendar_service") do
    it "It returns events on a calendar" do
      field_worker1 = FieldWorker.create(username: "antonio@trelora.com", trelora_id: 8)
      field_worker2 = FieldWorker.create(username: "karen@trelora.com", trelora_id: 12)
      field_worker3 = FieldWorker.create(username: "jenn@trelora.com", trelora_id: 14)
      field_worker4 = FieldWorker.create(username: "tanner@trelora.com ", trelora_id: 57)

      GoogleCalendarService.new.store_events
      expect(Appointment.count).to eq 21
      expect(Appointment.fourth.description).to eq "this is a summary"
      expect(Appointment.last.field_worker_id).to eq field_worker2.id
    end
  end
end

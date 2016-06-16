require 'google/apis/calendar_v3'

class GoogleCalendarService
  attr_reader :calendar

  def initialize
    @calendar = Google::Apis::CalendarV3::CalendarService.new
    scopes = ["https://www.googleapis.com/auth/calendar", "https://www.googleapis.com/auth/calendar.readonly", "https://www.googleapis.com/auth/plus.login"]
    this = ENV["TRELORA_GOOGLE_KEY"]
    File.write('./client_secrets.json', this)
    @calendar.authorization = Google::Auth.get_application_default(scopes)
  end

  def store_events
    calendar.list_events("primary").items.each do |event|
      field_worker = FieldWorker.find_by(username: event.attendees.last.email)
      if field_worker
        location = Location.find_or_create_by(address: event.location)
        Appointment.find_or_create_by(start_time: event.start.date_time,
          end_time: event.end.date_time,
          field_worker_id: field_worker.id,
          location_id: location.id,
          description: event.summary)
      end
    end
  end
end

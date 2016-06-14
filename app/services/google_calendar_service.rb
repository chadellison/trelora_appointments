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

  def create_event(event)
    calendar.insert_event("primary", event(event))
  end

  def event(hash)
    event = Google::Apis::CalendarV3::Event.new({
      summary: hash[:summary],
      location: hash[:location],
      description: hash[:description],
      start: {
        date_time: hash[:start_time],
        time_zone: 'America/Denver',
      },
      end: {
        date_time: hash[:end_time],
        time_zone: 'America/Denver',
      },
      attendees: [
        {email: hash[:email]}
      ]
    })
  end
end

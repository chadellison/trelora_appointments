require 'googleauth'
require 'google/apis/calendar_v3'

class GoogleCalendarService

  def initialize
    @calendar = Google::Apis::CalendarV3::CalendarService.new
    scopes = ["https://www.googleapis.com/auth/calendar", "https://www.googleapis.com/auth/calendar.readonly", "https://www.googleapis.com/auth/plus.login"]
    @calendar.authorization = Google::Auth.get_application_default(scopes)
    binding.pry
  end

  def list_events
    @calendar.list_events("primary")
  end

  def create_event(event)
    @calendar.insert_event("primary", event(event)).items
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

class GoogleCalendarService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com/calendar/v3/calendars/chad.ellison0123%40gmail.com/events")
    @connection.params[:access_token] = User.last.oauth_token if User.last
    @connection.params[:key] = ENV["GOOGLE_API_KEY"]
  end

  def events_hash
    parse(list_events)
  end

  private

    def list_events
      connection.get
    end

    def parse(response)
      JSON.parse(response.body)
    end
end

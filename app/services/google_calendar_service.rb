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

    def list_events #pass in dates here
      tomorrow = (Date.today + 1).to_datetime.to_s
      yesterday = (Date.today - 1).to_datetime.to_s
      connection.get do |req|
        req.params["timeMin"] = yesterday
        req.params["timeMax"] = tomorrow
        req.params["singleEvents"] = true
      end
    end

    def parse(response)
      JSON.parse(response.body)
    end
end

class GoogleCalendarService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com/calendar/v3/users/me/calendarList")
    @connection.params[:access_token] = User.last.oauth_token if User.last
    @connection.params[:key] = ENV["GOOGLE_API_KEY"]
  end
end

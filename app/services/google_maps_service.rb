class GoogleMapsService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com/calendar/v3/users/me/calendarList")
    @connection.params[:access_token] = User.last.oauth_token if User.last
    @connection.params[:key] = "AIzaSyDHdVSLBZT_4ViXkn3fk3YhvRZGQJF2e2I"
    # binding.pry
    # @connection.params[:scope] = "https://www.googleapis.com/auth/calendar"

    # works = Faraday.new(url: "https://www.googleapis.com/oauth2/v3/tokeninfo?access_token=ya29.CjD7An1yLS8_KJWFPZFEvK-rlMrEH6eCAwV33NzpVSxl0UZEORHOfL6Qvqvhq3B5ix4").get
  end

  def get_something
    @connection = Faraday.new(url: "https://www.googleapis.com/calendar/v3/users/me/calendarList/chad.ellison0123%40gmail.com?key=AIzaSyDHdVSLBZT_4ViXkn3fk3YhvRZGQJF2e2I")
  end
end

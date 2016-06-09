class GoogleCalendar < OpenStruct
  def service
    @service = GoogleMapsService.new.get_something
  end
end

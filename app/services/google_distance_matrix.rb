class GoogleDistanceMatrix
  attr_reader :connection, :loc_1, :loc_2, :trans_type

  def initialize
    @conn = Faraday.new("https://maps.googleapis.com/maps/api/distancematrix/json")
  end

  def time(loc_1, loc_2)
    response = parse(@conn.get("?origins=#{loc_1}&destinations=#{loc_2}&mode=driving&language=en&key=#{ENV['GOOGLE_API_KEY']}"))
    response[:rows][0][:elements][0][:duration][:value]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

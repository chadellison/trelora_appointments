class TreloraService

  def initialize
    @conn = Faraday.new("http://api.mytrelora.com/?api_key=#{ENV["TRELORA_API_KEY"]}")
  end

  def trelorian_small_img_url(id)
    response = @conn.get("members/#{id}")
    body = OpenStruct.new(JSON.parse response.body)
    icon = body.member["avatar"]["avatar"]["small"]["url"]
  end

end

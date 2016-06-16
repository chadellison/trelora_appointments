module CapybaraHelper
  def basic_auth!
    encoded_login = ["jones:123"].pack("m*")
    page.driver.header 'Authorization', "Basic #{encoded_login}"
  end
end

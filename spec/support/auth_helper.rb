# module AuthHelper
#   def encoded_auth_credentials
#     username = ENV['admin_username']
#     password = ENV['admin_password']
#
#     ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
#   end
#
#   def http_login
#     request.env['HTTP_AUTHORIZATION'] = encoded_auth_credentials
#   end
# end

module AuthHelper
  def http_login
    user = 'bob'
    pw = '123'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end

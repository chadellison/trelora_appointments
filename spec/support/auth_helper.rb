module AuthHelper
  def encoded_auth_credentials
    username = ENV['admin_username']
    password = ENV['admin_password']

    ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end

  def http_login
    request.env['HTTP_AUTHORIZATION'] = encoded_auth_credentials
  end
end

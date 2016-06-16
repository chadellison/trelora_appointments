class ApplicationController < ActionController::Base
  before_filter :authenticate
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

    def authenticate
      user = nil
      authenticate_or_request_with_http_basic do |username, password|
        user = User.find_by(username: username, password: password)
      end
      session[:user_id] = user.id if user
    end
end

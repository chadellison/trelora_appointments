class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    user.update(oauth_token: request.env["omniauth.auth"]["credentials"]["token"])
    redirect_to root_path
  end
end

class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    else
      flash[:error] = "Need To Be A Valid Trelora Employee"
    end
    user.update(oauth_token: request.env["omniauth.auth"]["credentials"]["token"]) if current_user
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to :root
  end
end

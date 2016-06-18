class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def create
    user = User.create(user_params)
    flash[:creat_user] = "#{user_params[:username]} was created"
    respond_with user, location: nil
    # redirect_to root_path
  end

  def show
    respond_with User.find(params[:id])
  end

  def destroy
    respond_with User.find(params[:id]).destroy, location: nil
  end

  private

  def user_params
    params.require(:user).permit(:username, :role, :token, :password, :id)
  end
end

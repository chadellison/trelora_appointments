class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def create
    User.create(user_params)
    flash[:success] = "#{user_params[:username]} was created"
    redirect_to root_path
  end

  def show
    respond_with User.find(params[:id])
  end

  def destroy
    respond_with User.find(params[:id]).destroy, location: nil
  end

  private

  def user_params
    params.require(:user).permit(:username, :role, :password)
  end
end

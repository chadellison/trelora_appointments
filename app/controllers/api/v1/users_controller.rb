class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def create
    user = User.create(user_params["post"])
    redirect_to api_v1_user_path(user.id)
  end

  def show
    respond_with User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.permit( "post" => "profile")
  end
end

class Api::V1::FieldWorkersController < Api::ApiController
  respond_to :json

  def index
    respond_with FieldWorker.all, day: params[:day]
  end

  def create
    if FieldWorker.create_f_w(f_w_params)
      redirect_to api_v1_field_workers_path
    else
      respond_with JSON.generate({"error" => "sorry try again" })
    end

  end

  def destroy
    FieldWorker.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def f_w_params
    params.require("post").permit(:role, :trelora_id, :username)
  end
end

class Api::V1::FieldWorkersController < Api::ApiController
  respond_to :json

  def index
    respond_with FieldWorker.where(status: "active"), day: params[:day]
  end

  def create
    respond_with FieldWorker.create_f_w(f_w_params)
  end

  def update
    FieldWorker.find(params[:id]).update(status: "inactive")
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def f_w_params
    params.require(:field_worker).permit(:role, :trelora_id, :username, :status)
  end
end

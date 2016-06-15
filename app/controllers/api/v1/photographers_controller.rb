class Api::V1::PhotographersController < Api::ApiController
  respond_to :json

  def index
    respond_with FieldWorker.where(status: "active", role: 0), day: params[:day]
  end
end

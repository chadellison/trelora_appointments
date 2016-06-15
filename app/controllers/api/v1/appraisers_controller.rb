class Api::V1::AppraisersController < Api::ApiController
  respond_to :json

  def index
    respond_with FieldWorker.where(status: "active", role: 1)
  end
end

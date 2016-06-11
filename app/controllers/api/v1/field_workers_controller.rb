class Api::V1::FieldWorkersController < Api::ApiController
  respond_to :json

  def index
    respond_with FieldWorker.all
  end
end

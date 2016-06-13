class Api::V1::FieldWorkersController < Api::ApiController
  respond_to :json

  def index
    respond_with FieldWorker.all, day: params[:day]
  end

  def create
    field_worker = FieldWorker.create(f_w_params)
    # response = Faraday.get("http://api.mytrelora.com/members/1?api_key=#{ENV["TRELORA_API_KEY"]}")
    # body = OpenStruct.new(JSON.parse response.body)
    # icon = body.member["avatar"]["avatar"]["small"]["url"]
    # field_worker.update(icon: icon)
    # redirect_to api_v1_field_workers_path
    respond_with FieldWorker.find(field_worker.id), location: nil
  end

  private

  def f_w_params
    params.require("post").permit(:role, :trelora_id, :username)
  end
end

require "rails_helper"

RSpec.describe Api::V1::AppraisersController do
  it "returns all appraisers field workers" do
    Appraiser.create(username: "Jane", role: 1, status: "active")
    get :index, format: :json
    expect(response).to have_http_status(:success)
    photographer_hash = JSON.parse(response.body, symbolize_names: :true)
    expect(photographer_hash.first.username).to eq "Jane"
    expect(photographer_hash.first.status).to eq "active"
    expect(photographer_hash.first.role).to eq "appraiser"
  end
end

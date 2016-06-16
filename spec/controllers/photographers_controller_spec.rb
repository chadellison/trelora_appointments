require "rails_helper"

RSpec.describe Api::V1::PhotographersController do
  VCR.use_cassette("photographers_controller") do
    include AuthHelper
    before(:each) do
      User.create(username: "bob", password: "123")
      http_login
    end
    it "returns all photographer field workers" do
      FieldWorker.create(username: "Bob", role: 0, status: "active")
      get :index, format: :json
      expect(response).to have_http_status(:success)
      photographer_hash = JSON.parse(response.body, symbolize_names: true)
      expect(photographer_hash.first[:username]).to eq "Bob"
      expect(photographer_hash.first[:status]).to eq "active"
      expect(photographer_hash.first[:role]).to eq "photographer"
    end
  end
end

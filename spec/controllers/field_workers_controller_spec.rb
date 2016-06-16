require "rails_helper"

RSpec.describe Api::V1::FieldWorkersController, type: :controller do
  include AuthHelper
  before(:each) do
    User.create(username: "bob", password: "123")
    http_login
    denver = Location.create(address: "Denver")
    boulder = Location.create(address: "Boulder")
    ft_collins = Location.create(address: "Fort Collins")
    appointment1 = denver.appointments.create(start_time: Date.today.to_datetime + 3.minute, description: "this description")
    appointment2 = boulder.appointments.create(start_time: Date.today.to_datetime + 6.hour)
    appointment3 = ft_collins.appointments.create(start_time: Date.today.to_datetime + 1)

    FieldWorker.create(username: "jones").appointments << appointment1
    frank = FieldWorker.create(username: "Frank")
    frank.appointments = [appointment2, appointment3]
  end

  describe "Get#index" do
    it "responds successfully" do
      get :index, format: :json
      expect(response).to have_http_status(:success)

      field_worker_hash = JSON.parse(response.body, symbolize_names: true)
      expect(field_worker_hash.first[:appointments].count).to eq 1
      expect(field_worker_hash.first[:appointments].first[:info][:description]).to eq "this description"
      expect(field_worker_hash.first[:appointments].first[:location][:address]).to eq "Denver"
      expect(field_worker_hash.last[:appointments].count).to eq 1
      expect(field_worker_hash.last[:username]).to eq "Frank"
    end
  end

  describe "Post#create" do
    it "responds successfully" do
      expect(FieldWorker.count).to eq 2

      post :create, format: :json, field_worker: { username: "jones@gmail.com", role: 1, trelora_id: 8, status: 1}
      expect(response).to have_http_status(:success)

      expect(FieldWorker.count).to eq 3

      field_worker_hash = JSON.parse(response.body, symbolize_names: true)
      expect(field_worker_hash[:username]).to eq "jones@gmail.com"
      expect(field_worker_hash[:role]).to eq "appraiser"
    end
  end

  describe "Patch#update" do
    it "responds successfully" do
      field_worker = FieldWorker.create(username: "jones@gmail.com", status: "active")

      patch :update, id: field_worker.id, format: :json, update: { id: field_worker.id, status: "inactive" }
      expect(response).to have_http_status(:success)
      expect(FieldWorker.find(field_worker.id).status).to eq "inactive"
    end
  end
end

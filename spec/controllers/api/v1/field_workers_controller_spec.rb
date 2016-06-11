require "rails_helper"

RSpec.describe Api::V1::FieldWorkersController, type: :controller do
  before(:each) do
    denver = Location.create(address: "Denver")
    boulder = Location.create(address: "Boulder")
    ft_collins = Location.create(address: "Fort Collins")
    appointment1 = denver.appointments.create(start_time: Date.today.to_datetime + 3.minute, description: "this description")
    appointment2 = boulder.appointments.create(start_time: Date.today.to_datetime + 6.hour)
    appointment3 = ft_collins.appointments.create(start_time: Date.today.to_datetime + 1)

    FieldWorker.create(username: "Jones").appointments << appointment1
    frank = FieldWorker.create(username: "Frank")
    frank.appointments = [appointment2, appointment3]
  end

  describe "GET#index" do
    it "responds successfully" do
      get :index, format: :json
      field_worker_hash = JSON.parse(response.body, symbolize_names: true)
      expect(field_worker_hash.first[:appointments].count).to eq 1
      expect(field_worker_hash.first[:appointments].first[:info][:description]).to eq "this description"
      expect(field_worker_hash.first[:appointments].first[:location][:address]).to eq "Denver"
      expect(field_worker_hash.last[:appointments].count).to eq 1
      expect(field_worker_hash.last[:username]).to eq "Frank"
    end
  end
end

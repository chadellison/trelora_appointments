require "rails_helper"

RSpec.describe Api::V1::AppointmentsController do
  include AuthHelper
  before(:each) do
    User.create(username: "bob", password: "123")
    http_login
  end

  it "returns the best appointment" do
    field_worker = FieldWorker.create(username: "antonio@trelora.com", status: "active")
    location = Location.create(address: "Union Station, Denver, CO")
    location2 = Location.create(address: "Seattle, Washington")
    appointment = field_worker.appointments.create(start_time: "5/12/2016", location_id: location.id)
    appointment2 = field_worker.appointments.create(start_time: "5/12/2016", location_id: location2.id)
    new_address = "1510 Blake st, Denver, CO"

    get :best_appointment, date: "12/05/2016", markerAddress: new_address, role: "undefined", format: :json

    expect(response).to have_http_status(:success)

    appointment = JSON.parse(response.body, symbolize_names: true)
    expect(appointment[:location][:address]).to eq "Union Station, Denver, CO"
  end

  it "returns the best url day" do
    field_worker = FieldWorker.create(username: "antonio@trelora.com", status: "active")
    location = Location.create(address: "Union Station, Denver, CO")
    location2 = Location.create(address: "Seattle, Washington")
    appointment = field_worker.appointments.create(start_time: "5/12/2016", location_id: location.id)
    appointment2 = field_worker.appointments.create(start_time: "5/12/2016", location_id: location2.id)
    new_address = "1510 Blake st, Denver, CO"

    get :url_best_day, date: "12/05/2016", markerAddress: new_address, role: "undefined", format: :json

    expect(response).to have_http_status(:success)

    marker_info = JSON.parse(response.body, symbolize_names: true)
    expect(marker_info.last[:address]).to eq "Union Station, Denver, CO"
    expect(marker_info.first[:address]).to eq "1510 Blake st, Denver, CO"
  end
end

require "rails_helper"

RSpec.describe Api::V1::AppointmentsController, type: :controller do
  before do
    @users = create_users(3)
    @roles = create_roles
    create_user_role(@users.first.id,@roles.first.id)
    create_user_role(@users.second.id,@roles.second.id)
    create_user_role(@users.last.id,@roles.last.id)
    create_locations
    create_appointments
  end

  describe "GET #index" do
    it "responds successfully" do
      get :index, format: :json
      parsed_json = JSON.parse(response.body)

      app1 = Appointment.first
      app2 = Appointment.last

      expect(response).to be_success
      expect(parsed_json.count).to eq(8)
      expect(parsed_json.first["id"]).to eq(app1.id)
      expect(parsed_json.first["start_time"].to_date).to eq(app1.start_time.to_date)
      expect(parsed_json.first["location"]["address"]).to eq(app1.location.address)
      expect(parsed_json.first["location"]["latitude"]).to eq(app1.location.latitude)
      expect(parsed_json.first["location"]["longitude"]).to eq(app1.location.longitude)
    end
  end
end

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "belong to" do
    it { is_expected.to belong_to(:location)}
    it { is_expected.to belong_to(:field_worker)}
  end

  VCR.use_cassette("best_appointment#appointment") do
    it "returns the best appointment" do
      field_worker = FieldWorker.create(username: "antonio@trelora.com", status: "active")
      location = Location.create(address: "Union Station, Denver, CO")
      location2 = Location.create(address: "Seattle, Washington")
      appointment = field_worker.appointments.create(start_time: "5/12/2016", location_id: location.id)
      appointment2 = field_worker.appointments.create(start_time: "5/12/2016", location_id: location2.id)
      new_address = "1510 Blake st, Denver, CO"

      expect(Appointment.best_appointment({
        date: "12/05/2016",
        markerAddress: new_address,
        role: "undefined"
        })).to eq appointment
    end

    it "returns the best appointment with a defined role" do
      field_worker = FieldWorker.create(username: "antonio@trelora.com", status: "active", role: "appraiser")
      location = Location.create(address: "Union Station, Denver, CO")
      location2 = Location.create(address: "Seattle, Washington")
      appointment = field_worker.appointments.create(start_time: "5/12/2016", location_id: location.id)
      appointment2 = field_worker.appointments.create(start_time: "5/12/2016", location_id: location2.id)
      new_address = "1510 Blake st, Denver, CO"

      expect(Appointment.best_appointment({
        date: "12/05/2016",
        markerAddress: new_address,
        role: "appraisers"
        })).to eq appointment
    end
  end
end

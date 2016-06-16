require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "belong to" do
    it { is_expected.to belong_to(:location)}
    it { is_expected.to belong_to(:field_worker)}
  end

  # context "it finds the best appointment" do
  #   it "returns the best appointment" do
  #     location = Location.create(address: "Union Statdion, Denver, CO")
  #     location2 = Location.create(address: "Seattle, Washington")
  #     appointment = Appointment.create(start_time: Date.today, location_id: location.id)
  #     appointment2 = Appointment.create(start_time: Date.today, location_id: location2.id)
  #     new_address = "1510 Black st, Denver, CO"
  #
  #     appointments = [appointment, appointment2]
  #
  #     expect(Appointment.best_appointment({
  #       appointments: appointments,
  #       markerAddress: new_address
  #       })).to eq appointment
  #   end
  # end
end

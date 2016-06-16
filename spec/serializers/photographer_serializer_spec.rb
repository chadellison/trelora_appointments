require 'rails_helper'

RSpec.describe PhotographerSerializer, :type => :serializer do

  describe "appointments-attributes" do
    it "should return the appointments for that day sorted by time" do
      field_worker = FieldWorker.create(username: "antonio@trelora.com", role: 1, status: "active")
      appointment1 = field_worker.appointments.create(start_time: Date.today + 5.hours)
      appointment2 = field_worker.appointments.create(start_time: Date.today + 10.hours)
      appointment3 = field_worker.appointments.create(start_time: Date.today + 7.hours)
      appointment4 = field_worker.appointments.create(start_time: Date.today + 9.hours)

      serialized = serialize(field_worker)
      field_worker = JSON.parse(serialized, symbolize_names: true)
      expect(field_worker[:username]).to eq "antonio@trelora.com"
      expect(field_worker[:status]).to eq "active"
      expect(field_worker[:role]).to eq "appraiser"
      expect(field_worker[:appointments].count).to eq 4
      expect(field_worker[:appointments][0][:info][:start_time].to_datetime).to eq appointment1.start_time
      expect(field_worker[:appointments][1][:info][:start_time].to_datetime).to eq appointment3.start_time
      expect(field_worker[:appointments][2][:info][:start_time].to_datetime).to eq appointment4.start_time
      expect(field_worker[:appointments][3][:info][:start_time].to_datetime).to eq appointment2.start_time
    end
  end
end

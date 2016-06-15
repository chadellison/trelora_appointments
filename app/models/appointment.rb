class Appointment < ActiveRecord::Base
  belongs_to :location
  belongs_to :field_worker

  def self.filter_by_day(day)
    day = DateTime.strptime(day, "%m/%d/%Y").to_datetime if day.is_a? String
    where(start_time: (day + 1.second)..(day + end_time)).order(:start_time)
  end

  def self.end_time
    23.hour + 59.minute + 59.second
  end

  def self.best_appointment(params)
    appointments = Appointment.where(id: params[:appointments].split(","))
    appointments.sort_by do |appointment|
      time = GoogleDistanceMatrix.new.time(appointment.location.address, params[:markerAddress])
    end.first
  end
end

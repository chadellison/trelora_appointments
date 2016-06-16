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

  def url_time
    start_time.strftime("%m/%d/%Y")
  end

  def self.best_appointment(params)
    appointments = find_by_url_time(params[:date],params[:role])
    appointments.sort_by do |appointment|
      GoogleDistanceMatrix.new.time(appointment.location.address, params[:markerAddress])
    end.first
  end

  def self.find_by_url_time(date,role)
    if role != "x"
      appointments = Appointment.joins(:field_worker).where("field_workers.status = ? AND field_workers.role = ?", 'active', f_w_role_converter(role))
    else
      appointments = Appointment.joins(:field_worker).where("field_workers.status = ?", 'active')
    end
    appointments.select { |a| a.url_time == date }
  end

  def self.f_w_role_converter(role)
    role == "photographers" ? role = 0 : role = 1
  end

end

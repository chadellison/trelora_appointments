class Appointment < ActiveRecord::Base
  belongs_to :location
  belongs_to :field_worker

  def self.filter_by_day(day = 0)
    where(start_time: (start_time + day)..(end_time + day)).order(:start_time)
  end

  def self.start_time
    Date.today.to_datetime + 1.second
  end

  def self.end_time
    Date.today.to_datetime + 23.hour + 59.minute + 59.second
  end
end

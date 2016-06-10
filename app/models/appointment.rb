class Appointment < ActiveRecord::Base
  belongs_to :location
  belongs_to :field_worker
end

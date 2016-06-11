class FieldWorker < ActiveRecord::Base
  has_many :appointments
  has_many :locations, through: :appointments
end

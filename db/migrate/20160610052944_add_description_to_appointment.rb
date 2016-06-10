class AddDescriptionToAppointment < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.datetime :end_time
      t.string :description
    end
  end
end

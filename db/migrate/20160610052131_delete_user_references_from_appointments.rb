class DeleteUserReferencesFromAppointments < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.remove :user_id
      t.references :field_worker
    end
  end
end

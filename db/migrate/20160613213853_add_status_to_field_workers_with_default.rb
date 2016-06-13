class AddStatusToFieldWorkersWithDefault < ActiveRecord::Migration
  def change
    change_table :field_workers do |t|
      t.remove :status
      t.string :status, default: "active"
    end
  end
end

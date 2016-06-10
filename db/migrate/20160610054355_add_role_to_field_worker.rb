class AddRoleToFieldWorker < ActiveRecord::Migration
  def change
    change_table :field_workers do |t|
      t.integer :role
    end
  end
end

class AddStatusToFieldWorkers < ActiveRecord::Migration
  def change
    add_column :field_workers, :status, :string
  end
end

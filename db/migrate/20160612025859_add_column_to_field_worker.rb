class AddColumnToFieldWorker < ActiveRecord::Migration
  def change
    add_column :field_workers, :trelora_id, :integer
  end
end

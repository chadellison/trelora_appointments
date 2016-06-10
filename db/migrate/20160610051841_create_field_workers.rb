class CreateFieldWorkers < ActiveRecord::Migration
  def change
    create_table :field_workers do |t|
      t.string :username
      t.string :icon

      t.timestamps null: false
    end
  end
end

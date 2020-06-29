class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :is_active
      t.datetime :start_datetime

      t.timestamps
    end
  end
end

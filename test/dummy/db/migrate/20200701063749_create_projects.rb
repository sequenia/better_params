class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.boolean :is_active
      t.boolean :is_show

      t.timestamps
    end
  end
end

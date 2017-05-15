class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :ta_id
      t.datetime :start
      t.datetime :end
      t.boolean :confirmed

      t.timestamps
    end
  end
end

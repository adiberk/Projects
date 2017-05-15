class CreateOfficehours < ActiveRecord::Migration[5.0]
  def change
    create_table :officehours do |t|
      t.integer :course_id
      t.integer :ta_id
      t.datetime :start
      t.datetime :end
      t.boolean :online

      t.timestamps
    end
  end
end

class CreateMajors < ActiveRecord::Migration[5.0]
  def change
    create_table :majors do |t|
      t.integer :university_id
      t.string :name

      t.timestamps
    end
  end
end

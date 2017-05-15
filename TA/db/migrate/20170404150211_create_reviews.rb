class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :student_id
      t.integer :ta_id
      t.integer :score
      t.text :review
      t.integer :course_id

      t.timestamps
    end
  end
end

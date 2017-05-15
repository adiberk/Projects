class AddAbbreviationToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :abbrev, :string
  end
end

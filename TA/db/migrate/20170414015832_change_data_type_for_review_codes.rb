class ChangeDataTypeForReviewCodes < ActiveRecord::Migration[5.0]
  def change
  	change_table :reviews do |t|
      t.change :score, :float
    end
  end
end

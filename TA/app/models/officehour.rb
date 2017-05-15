class Officehour < ApplicationRecord
	belongs_to :user, :foreign_key => 'ta_id'
	belongs_to :course
	validate :must_be_ta_of_course

	def must_be_ta_of_course
		if (EnrollmentTa.find_by(course_id: self.course_id, user_id: self.ta_id) == nil)
			errors.add(:base, 'Must be a ta for course')
		end
	end
end

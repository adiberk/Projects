class EnrollmentTa < ApplicationRecord
	belongs_to :user
	belongs_to :course
	validate :is_student
	validate :course_exists

	def course_exists
		if (Course.find_by(id: self.course_id) == nil)
			errors.add(:base, 'Course does not exist')
		end
	end
	def is_student
		if (Enrollment.find_by(user_id: self.user_id, course_id: self.course_id) != nil)
			errors.add(:base, 'Can not be a student and TA of the course')
		end
	end
end

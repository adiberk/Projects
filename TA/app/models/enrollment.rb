class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validate :is_ta

  def is_ta
  	if (EnrollmentTa.find_by(user_id: self.user_id, course_id: self.course_id) != nil)
  		errors.add(:base, 'Can not be a TA and be a student in the course')
  	end
  end
end

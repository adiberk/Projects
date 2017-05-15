class Review < ApplicationRecord

  belongs_to :ta, :class_name => "User"
  belongs_to :student, :class_name => "User"
  validate :must_have_ta
  validate :must_have_review
  validate :empty_score
  def must_have_ta
  	student_enrollments = Enrollment.where(course_id:self.course_id, user_id: self.student_id)
  	ta_enrollments = EnrollmentTa.where(course_id:self.course_id, user_id:self.ta_id)
  	if (ta_enrollments.length == 0 || student_enrollments.length == 0)
  		errors.add(:base, 'Can not write review because not enrolled in any courses with this TA')
  	end
  
  end

  def must_have_review
    review = self.review
    if review == nil || review == "" || review == " "
      errors.add(:base, "Review can not be blank")
    end
  end

  def empty_score
    if self.score == nil || self.score == 0
      errors.add(:base, "You need to rate your TA to write review")
    end
  end
end

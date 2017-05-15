class Appointment < ApplicationRecord
	belongs_to :ta, :class_name => "User"
	belongs_to :student, :class_name => "User" 
	validate :appointment_request
	validate :appointment_create
	def appointment_request
		if (Appointment.find_by(ta_id: self.ta_id, student_id: self.student_id, course_id: self.course_id, start: self.start))
			errors.add(:base, 'Appointment already requested')
		end
		if (Appointment.find_by(ta_id: self.ta_id, course_id: self.course_id, start: self.start, confirmed:true))
			errors.add(:base, 'Appointment already taken')
		end
	end

	def appointment_create
		if (EnrollmentTa.find_by(user_id: self.ta_id, course_id: self.course_id) == nil)
			errors.add(:base, 'TA not enrolled in course')
		end
		if (Enrollment.find_by(user_id: self.student_id, course_id: self.course_id) == nil)
			errors.add(:base, 'Student not enrolled in course')
		end
	end

end


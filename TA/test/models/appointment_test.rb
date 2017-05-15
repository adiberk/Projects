require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user1 = User.create!(first_name: "Example", last_name: "User", username: "euser", email: "user1@example.com", university_id:"1", password: "foobar", password_confirmation: "foobar", confirmed_at: Time.now)
  	@user2 = User.create!(first_name: "Example", last_name: "User", username: "myuser", email: "user2@example.com", university_id:"1", password: "foobar", password_confirmation: "foobar", confirmed_at: Time.now)
  	University.create!(id:1, name:"uni")
  	Major.create!(id:1, university_id:1, name:"Computer Science")
  	mycourse = Course.create!(name: "Blah", major_id: 1)
  	enroll = Enrollment.create!(user_id:@user1.id, course_id: mycourse.id)
  	enrollta = EnrollmentTa.create!(user_id: @user2.id, course_id: mycourse.id)
  	@app = @user2.ta_appointments.new(course_id: mycourse.id, student_id:@user1.id, start: Time.now, end: Time.now)
  	@appo2 = @user2.student_appointments.new(course_id:mycourse.id, ta_id:@user1.id, start: Time.now, end: Time.now)
  end

  test "app is valid" do
  	assert @app.valid?
  end

  test "app is not student of course" do
  	assert_not @appo2.valid?
  end
end

require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user1 = User.create!(first_name: "Example", last_name: "User", username: "euser", email: "user1@example.com", university_id:"1", password: "foobar", password_confirmation: "foobar", confirmed_at: Time.now)
  	@user2 = User.create!(first_name: "Example", last_name: "User", username: "myuser", email: "user2@example.com", university_id:"1", password: "foobar", password_confirmation: "foobar", confirmed_at: Time.now)
  	University.create!(id:1, name:"uni")
  	Major.create!(id:1, university_id:1, name:"Computer Science")
  	mycourse = Course.create!(name: "Blah", major_id: 1)
  	@enrollment = Enrollment.new(course_id:mycourse.id, user_id: @user1.id)
  end
  test "enrollment is valid" do
  	assert @enrollment.valid?
  end
  test "course_id must exist" do
  	enrol = Enrollment.new(course_id:13, user_id: @user2.id)
  	assert_not enrol.valid?
  end
end

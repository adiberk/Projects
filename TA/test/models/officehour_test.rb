require 'test_helper'

class OfficehourTest < ActiveSupport::TestCase
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
  	@offhour = @user2.officehours.new(course_id: mycourse.id, start: Time.now, end: Time.now, online: true)
  end

  test "should be valid" do
    assert @offhour.valid?
  end

  test "ta is actual ta" do
    f = EnrollmentTa.find_by(user_id: @offhour.ta_id)
    if f != nil
    	assert true
    else
    	assert false
    end
  end

  test "test must be ta of course" do
  	off = @user2.officehours.new(course_id:3)
  	assert_not off.valid? 
  end
end

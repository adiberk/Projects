module EnrollmentTasHelper

  def get_ta_list_from_enrollment_tas(enrollment_ta)
    ta_list = []
    enrollment_ta.each do |each_enroll_ta|
      ta_list.push(each_enroll_ta['user_id'])
    end
    return ta_list.uniq
  end

  def get_user_list_from_users(users)
    user_list = []
    users.each do |user|
      user_list.push(user['id'])
    end
    return user_list
  end

  def find_tacourses_from_user(user)
    tacourses=''
    user.tacourses.each do |each_course|
      tacourses = tacourses + each_course['name'] + " | "
    end

    return tacourses[0..tacourses.length-4]
  end

end

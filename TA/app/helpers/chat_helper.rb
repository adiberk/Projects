module ChatHelper
  def online?()
    str = '<svg width="14" height="14" id="Green_Ball" data-name="Green Ball" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2 2"><defs><style>.cls-1{fill:#090;}</style></defs><circle class="cls-1" cx="1" cy="1" r=".9"/></svg>'
	str.html_safe
  end

  def your_tas(user)
  	course_list = user.courses
  	ta_list = Array.new
  	str = ""

  	course_list.each do |course|
	    enrolled = course.enrollment_tas
	    if enrolled.length == 0
	      return "No courses"     #keep return here?
	    end

	    enrolled.each do |e|
	    	ta_list.push(e)
	    end
	end

	ta_list = ta_list.uniq

	ta_list.each do |ta|
		str += "<li>#{@users.find(ta.user_id).first_name} #{@users.find(ta.user_id).last_name} </li>"
	end


    str.html_safe
  end
end
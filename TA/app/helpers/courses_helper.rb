module CoursesHelper
  def get_course_list()
	  my_courses = current_user().courses
      if my_courses.length == 0
        return "Not registered for courses"
      end
    name = my_courses[0].name
    id = my_courses[0].id

    #str = "<li> <%= link_to 'name', :controller => 'courses', :action =>'show', :course_id=>'id', :course_name=>'name' %> </li>"
    str = "<li> test </li>"

	  count = 1
      while count < my_courses.length

        name = my_courses[count].name
        id = my_courses[count].id

        #str += "<li> <%= link_to 'name', :controller => 'courses', :action =>'show', :course_id=>'id', :course_name=>'name' %> </li>"
        str += "<li> test </li>"

      	count+=1;
      end
      str.html_safe
  end

  def is_ta_of_course (user, course)
    talist = course.tas
    talist.each do |ta|
      if user.id == ta.id
        return true
      end
    end
    return false
  end

  def get_confirmed_appointments(tas)
    apps = []
    tas.each do |ta|
      hold = ta.ta_appointments
      hold.each do |app|
        if app.confirmed == true
          apps.push(app)
        end
      end
    end
    return apps
  end

  def get_student_list(course)
    enrolled = course.enrollments
    if enrolled.length == 0
      return "Not registered for courses"     #keep return here?
    end

    str = ""
    enrolled.each do |e|
      str += "<li>#{@users.find(e.user_id).first_name} #{@users.find(e.user_id).last_name} </li>"
    end
    str.html_safe
  end

  def get_ta_list(course)
    enrolled = course.enrollment_tas
    if enrolled.length == 0
      return "Not registered for courses"     #keep return here?
    end

    str = ""
    enrolled.each do |e|
      str += "<li>#{@users.find(e.user_id).first_name} #{@users.find(e.user_id).last_name} </li>"
    end
    str.html_safe
  end


  def off_hour(officehours, count, jcount)
    hour = nil
    if (officehours.many? == false && officehours!=nil && officehours.size>0)
      if (officehours[0].start.strftime('%a').downcase.eql?(@days[count].split(" ")[0].downcase))
        if(officehours[0].start.strftime("%l:%M%p").split(" ")[0].eql?(parseHours(@hours)[jcount]))
          hour = officehours[0]
        end
      end
    else
      officehours.each do |offh|
        if (offh.start.strftime('%a').downcase.eql?(@days[count].split(" ")[0].downcase))
          if(offh.start.strftime("%l:%M%p").split(" ")[0].eql?(parseHours(@hours)[jcount]))
            hour = offh
          end
        end
      end
    end
    if hour != nil
      return hour
    else
      return nil
    end
  end

  def create_header(days)
    dayHeaderContainer = "<div class = 'header'><div class = 'align-block'></div>"
    days.each do |day|
      dayHeaderContainer = dayHeaderContainer +  "<div class = 'header-item #{day}-header'><h3 class = 'day-titles'>#{day.upcase}</h3></div>"
    end
    dayHeaderContainer += "</div>"
    return dayHeaderContainer.html_safe
  end
  def parseHours(string)
    output = []
    split = string.upcase.split("-")
    startInt = Integer(split[0].split(":")[0])
    endInt = Integer(split[1].split(":")[0])
    # byebug

    startHour = 0
    if split[0].include?("PM")
      startHour = startInt+12
      # byebug
    else
      startHour = startInt
    end
    endHour = 0
    if split[1].include?("PM")
      endHour = endInt+12;
      # byebug
    end
    # byebug
    curHour = startHour
    count = 0
    while curHour <= endHour do
      parsedStr = ''

      if (curHour > 12)
        if (count  == 0)
              parsedStr += (curHour-12).to_s + ":00 PM"
              count = 1
        else
          parsedStr += (curHour-12).to_s+ ":30 PM"
          count = 0
        end
      elsif curHour == 12
        if count == 0
          parsedStr += curHour.to_s + ":00 PM"
          count = 1
        else
          parsedStr += curHour.to_s + ":30 PM"
          count = 0
        end
      else
        if (count  == 0)
          parsedStr += (curHour).to_s + ":00 AM"
          count = 1
        else
          parsedStr += (curHour).to_s + ":30 AM"
          count = 0
        end
      end
      if count == 0
        curHour+=1
      end
      # curHour+=1
      output.push(parsedStr)
    end
    return output;
  end

  def capitalize(string)
    return string.charAt(0).upcase + string.slice!(0)
  end


end

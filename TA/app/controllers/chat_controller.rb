class ChatController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])

  	@user = current_user
  	@course_list = @user.courses
  	@ta_list = Hash.new

  	@course_list.each do |course|
  		course.tas.each do |ta|
  			if !@ta_list.has_key?(ta)
          @ta_list[ta] = course.abbrev
        end
  		end
  	end

	@student_list = Array.new
  if @user.tacourses != nil
    @course_list = @user.tacourses
  	@course_list.each do |course|
  		course.enrollments.each do |e|
        
  			if e.user_id == current_user.id
  				#skip
  			else
  				@student_list.push(@users.find(e.user_id))
  			end
  		end
  	end
  end

	@student_list = @student_list.uniq

  end
end

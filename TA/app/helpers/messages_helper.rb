module MessagesHelper
  def get_name()

    #str = "<li> <%= link_to 'name', :controller => 'courses', :action =>'show', :course_id=>'id', :course_name=>'name' %> </li>"
    str = "" + current_user.first_name

    str.html_safe
  end

end

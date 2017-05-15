class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:taprofile_update,:taprofile]
  # before_action :logged_in_user, only: [:edit, :update]


  # GET /users
  # GET /users.json
  def taprofile

    ta_id=params[:ta_id]

    # after submit the new reviews
    score = params[:score]
    course_id = params[:course_id]
    ta_id = params[:ta_id]
    user_id = params[:user_id] #for new review
    review = params[:review]
    if user_id != nil
      review = Review.new(ta_id: ta_id, student_id:user_id, course_id: course_id, review: review, score: score)

      if !review.save(ta_id: ta_id, student_id:user_id, course_id: course_id, review: review, score: score)
        errors = review.errors.messages
        flash.now[:danger] = errors[:base][0]
      else
        redirect_to action:'taprofile', ta_id:ta_id
      end

    end

    @user = User.find(ta_id)
    @courses = Course.all

  end


  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user
    @courses = Course.all
    days_hold = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', "Saturday"]
    @days = []
    f = 0
    days_hold.each do |d|
      day = Date.parse(d)
      if day > (Date.today+f)
          day -= 7
      end
      f+=1
      @days.push(day.strftime('%a %d/%m/%y'))
    end
    @hours = "8:00AM-8:00PM"
    @fontFamily = "Montserrat"
    @fontColor = "black"
    @fontWeight =  "100"
    @fontSize = "0.8em"
    @hoverColor = "#727bad"
    @selectionColor = "#9aa7ee"
    @headerBackgroundColor = "transparent"
    # debugger
  end

  # GET /users/new
  def new
    @user = User.new
  end
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = "User was successfully created."
        # redirect_to @user
        format.html { redirect_to @user}
        format.json { render :show, status: :created, location: @user }
      else
        # render 'new'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def go_offline
    @user = set_user
    @user.online = false
    @user.save
    redirect_to root_url
  end
  def go_online
    @user = set_user
    @user.online = true
    @user.save
    redirect_to root_url
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :picture)
    end
end

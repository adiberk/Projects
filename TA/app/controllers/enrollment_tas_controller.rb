class EnrollmentTasController < ApplicationController
  before_action :set_enrollment_ta, only: [:show, :edit, :update, :destroy]
  include EnrollmentTasHelper
  # GET /enrollment_tas
  # GET /enrollment_tas.json

  #Using for the ta_list
  def talist
    @courses = Course.all
    @user=User.all

      @enrollment_tas = EnrollmentTa.all
      @ta_list=get_ta_list_from_enrollment_tas(@enrollment_tas)
      render 'talist'

  end
  def talistfilter
    ta_name = params[:name]
    puts ta_name

    users_fname=User.where("lower(first_name) LIKE lower(?)", "%#{ta_name}%")
    users_lname=User.where("lower(last_name) LIKE lower(?)", "%#{ta_name}%")

    user_fname_list=get_user_list_from_users(users_fname)
    user_lname_list=get_user_list_from_users(users_lname)
    user_list = user_fname_list | user_lname_list
    @enrollment_tas = EnrollmentTa.all
    ta_list=get_ta_list_from_enrollment_tas(@enrollment_tas)
    @ta_list = ta_list & user_list
    render :partial => 'partial'

  end
  def talistfilter2
    course_name = params[:coursename]
    @courses=Course.where("lower(name) LIKE lower(?)", "%#{course_name}%")

    render :partial => 'partial2'
  end


  def index
    @enrollment_tas = EnrollmentTa.all
  end

  # GET /enrollment_tas/1
  # GET /enrollment_tas/1.json
  def show
  end

  # GET /enrollment_tas/new
  def new
    @enrollment_ta = EnrollmentTa.new
  end

  # GET /enrollment_tas/1/edit
  def edit
  end

  # POST /enrollment_tas
  # POST /enrollment_tas.json
  def create
    @enrollment_ta = EnrollmentTa.new(enrollment_ta_params)

    respond_to do |format|
      if @enrollment_ta.save
        format.html { redirect_to @enrollment_ta, notice: 'Enrollment ta was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment_ta }
      else
        format.html { render :new }
        format.json { render json: @enrollment_ta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollment_tas/1
  # PATCH/PUT /enrollment_tas/1.json
  def update
    respond_to do |format|
      if @enrollment_ta.update(enrollment_ta_params)
        format.html { redirect_to @enrollment_ta, notice: 'Enrollment ta was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment_ta }
      else
        format.html { render :edit }
        format.json { render json: @enrollment_ta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollment_tas/1
  # DELETE /enrollment_tas/1.json
  def destroy
    @enrollment_ta.destroy
    respond_to do |format|
      format.html { redirect_to enrollment_tas_url, notice: 'Enrollment ta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment_ta
      @enrollment_ta = EnrollmentTa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_ta_params
      params.require(:enrollment_ta).permit(:course_id, :user_id)
    end
end

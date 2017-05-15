class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end
  def confirm_app
    @appointment = Appointment.find(params[:id])
    # @appointment.confirmed = params[:confirmed]
    respond_to do |format|
      if @appointment.update_attribute(:confirmed, params[:confirmed])
        format.js {render 'users/confirm_app'}
      end
    end
  end

  def unconfirm_app
    @appointment = Appointment.find(params[:id])
    # @appointment.confirmed = params[:confirmed]
    respond_to do |format|
      if @appointment.update_attribute(:confirmed, params[:confirmed])
        format.js {render 'users/confirm_app'}
      end
    end
  end
  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    respond_to do |format|
      if @appointment.save!
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def request_app
    @appointment = Appointment.new(appointment_params)
    # respond_to do |format|
    @appointment.start = "20"+@appointment.start.to_s[2..@appointment.start.to_s.length]
      if @appointment.save
        flash[:success] = 'Sent appointment request (to cancel, please check your user page)'
        redirect_to :controller => 'courses', :action=>'show', :id=> @appointment.course_id, :name=>Course.find(@appointment.course_id).name
      else
        redirect_to :controller => 'courses', :action=>'show', :id=> @appointment.course_id, :name=>Course.find(@appointment.course_id)
        errors = @appointment.errors.messages
        flash[:danger] = errors[:base][0]
      end
    # end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:course_id, :student_id, :ta_id, :start, :end, :confirmed)
    end
end

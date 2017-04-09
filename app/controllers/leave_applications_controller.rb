class LeaveApplicationsController < ApplicationController
	before_action :set_leave_application, only: [:show, :edit, :update, :destroy, :approve_leave, :reject_leave]

  # GET /leave_applies
  # GET /leave_applies.json
  def index
  	if current_user.role_id == 1
  	  @leave_applications = LeaveApplication.all.decorate
  	else
     @leave_applications = current_user.leave_applications.all.decorate
    end
  end

  # GET /leave_applies/1
  # GET /leave_applies/1.json
  def show
  end

  # GET /leave_applies/new
  def new
    @leave_application = LeaveApplication.new
  end

  # GET /leave_applies/1/edit
  def edit
  end

  # POST /leave_applies
  # POST /leave_applies.json
  def create

    @leave_application = LeaveApplication.new(leave_application_params)

    respond_to do |format|
      if @leave_application.save
        format.html { redirect_to leave_applications_path, notice: 'Leave apply was successfully created.' }
        format.json { render :show, status: :created, location: @leave_application }
      else
        format.html { render :new }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_applies/1
  # PATCH/PUT /leave_applies/1.json
  def update
    respond_to do |format|
      if @leave_application.update(leave_application_params)
        format.html { redirect_to @leave_application, notice: 'Leave apply was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_application }
      else
        format.html { render :edit }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  #/approve_leave
  def approve_leave
  	if @leave_application.update_attributes(:status => params[:status])
  		flash[:notice] = "Leave approved successfully"
  		redirect_to leave_applications_path
  	else
  		flash[:alert] = "Leave approved failed.Try Again."
  		redirect_to leave_applications_path
  	end
  end

  #/reject_leave
  def reject_leave
  	if @leave_application.update_attributes(:status => params[:status])
  		flash[:notice] = "Leave rejected successfully"
  		redirect_to leave_applications_path
  	else
  		flash[:alert] = "Leave rejected failed.Try Again."
  		redirect_to leave_applications_path
  	end
  end

  # DELETE /leave_applies/1
  # DELETE /leave_applies/1.json
  def destroy
    @leave_application.destroy
    respond_to do |format|
      format.html { redirect_to leave_applies_url, notice: 'Leave apply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_application
      @leave_application = LeaveApplication.find(params[:id])
    end

    def leave_application_params
      params.require(:leave_application).permit(:start_date, :end_date, :leave_type, :session_name, :status, :reason, :user_id)
    end
end


require 'test_helper'

class LeaveApplicationsControllerTest < ActionController::TestCase
  setup do
    @leave_application = leave_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_application" do
    assert_difference('LeaveApplication.count') do
      post :create, leave_application: { end_date: @leave_application.end_date, leave_type: @leave_application.leave_type, reason: @leave_application.reason, session_name: @leave_application.session_name, start_date: @leave_application.start_date, status: @leave_application.status }
    end

    assert_redirected_to leave_application_path(assigns(:leave_application))
  end

  test "should show leave_application" do
    get :show, id: @leave_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_application
    assert_response :success
  end

  test "should update leave_application" do
    patch :update, id: @leave_application, leave_application: { end_date: @leave_application.end_date, leave_type: @leave_application.leave_type, reason: @leave_application.reason, session_name: @leave_application.session_name, start_date: @leave_application.start_date, status: @leave_application.status }
    assert_redirected_to leave_application_path(assigns(:leave_application))
  end

  test "should destroy leave_application" do
    assert_difference('LeaveApplication.count', -1) do
      delete :destroy, id: @leave_application
    end

    assert_redirected_to leave_applications_path
  end
end

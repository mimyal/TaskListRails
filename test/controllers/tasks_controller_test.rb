require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "A logged-in user should have full access to the tasks through the index page" do
    session[:user_id] = users(:alma).id

    get :index
    assert_response :success
    assert_template 'tasks/index'

    # tasks_from_controller = assigns(:task_entries)
    #
    # assert_equal(tasks_from_controller.length users(:alma).tasks.length)
  end

  test "If a user is not logged in they cannot view a task (show)" do
    session[:user_id] = nil  # ensure no one is logged in

    get :show, id: tasks(:one_alma).id
    # if they are not logged in they cannot see the resource and are redirected to login.
    assert_redirected_to root_path
  end

  test "Not-logged-in user should get redirected from tasks" do
    session.delete(:user_id)
    get :index
    assert_response :redirect
    assert_redirected_to root_path
  end
end

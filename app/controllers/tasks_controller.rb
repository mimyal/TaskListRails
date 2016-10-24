class TasksController < ApplicationController
  before_action :require_login

  def index
    @task_entries = Task.all
  end

  def show
    @entry = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      # SAVED SUCCESSFULLY
      redirect_to root_path
      # redirect_to tasks_path # ?
    else
      # DID NOT SAVE
      render :new
    end
  end

  def edit # << LIKE NEW
    @task = Task.find(params[:id])
  end

  def update # << LIKE CREATE
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  def completed_task
    @task = Task.find(params[:id])
    if @task.completion_date == nil
      @task.completion_date = Time.now
      @task.save
    end
    redirect_to tasks_path
  end

  # ##############
  private
  # ##############

  def task_params
    params.require(:task).permit(:title, :description, :owner, :completion_date)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to root_path
    end
  end

end

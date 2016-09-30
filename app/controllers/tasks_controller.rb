class TasksController < ApplicationController

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


  # ##############
  private
  # ##############

  def task_params
    params.require(:task).permit(:title, :description, :owner, :completion_date)
  end

end

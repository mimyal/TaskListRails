class TasksController < ApplicationController

  def index
    @task_entries = Task.all
    # mini-csv with name, description, completion_status, completion_date
    # @task_entries = [
    #   ["Lunch Prep", "Pasta and cheese", false, nil],
    #   ["Cat walk", "No further than two blocks", true, "08/19/12"],
    #   ["Circus", "Run away with circus", false, nil]
    # ]
  end

  #complete information about the task: name, description, completion status, and completion date
  def show
    @entry = Task.find(params[:id])
    # @task_entry = {
    #   name: "Lunch Prep",
    #   description: "Pasta and meatballs",
    #   completion_status: false,
    #   completion_date: nil,
    #   featured: true
    # }

    # task_entries = [
    #   ["Lunch Prep", "Pasta and cheese", false, nil],
    #   ["Cat walk", "No further than two blocks", true, "08/19/12"],
    #   ["Circus", "Run away with circus", false, nil]
    # ]
    # entry_id = Integer(params[:id])
    # @entry = task_entries[entry_id]
  end

  def new; end

  def create
    redirect_to root_path
  end

end

module ApplicationHelper
  def short_time(task)
    if task.completion_date != nil
      return task.completion_date.strftime("Task completed on: %Y-%m-%d")
    else
    return "Task Incomplete"
    end
  end


end

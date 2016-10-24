module ApplicationHelper
  def short_time(task)
    if task.completion_date != nil
      return task.completion_date.strftime("Task completed on: %Y-%m-%d")
    else
      return "Task Incomplete"
    end
  end

  def log_in_out_button
    if session[:user_id] == nil
      return button_to("Log In", '/auth/github')
    else
      return button_to("Log Out", sessions_path, method: :delete)
    end
  end

  def log_in_out_message
    if session[:user_id] == nil
      return "Tasks. All Ours. Log In Or Go Away."
    else
      return "All Tasks Are Belong To Us, #{session[:email]}"
    end
  end

  def logout_msg
    if session[:user_id] != nil
      return redirect_to root_path
    end
  end

end

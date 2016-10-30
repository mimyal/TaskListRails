class SessionsController < ApplicationController

  def index
    if  session[:user_id].nil?
      flash[:notice] = "You must be logged in first"
      redirect_to root_path
    else
      @user = User.find(session[:user_id]) # < recalls the value set in a previous request
      # implicit call to
      render :index
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    # Login Failure if uid is missing ->
    redirect to login_failure_path unless auth_hash['uid']

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @user = User.build_from_github(auth_hash)
      # Login Failure if @user cannot save in creating a new user
      render :creation_failure unless @user.save
    end

    # Save the user ID in the session
    session[:user_id] = @user.id
    session[:email] = @user.email

    redirect_to tasks_path
  end

  def login_failure; end

  def destroy
    session.delete(:user_id)
    session.delete(:email)
    redirect_to root_path
  end

end

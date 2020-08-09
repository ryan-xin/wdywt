class SessionController < ApplicationController

  # Login Form Page -------------------------------------------
  def new
  end

  # Login submits here ----------------------------------------
  def create
    # Check if the user exists
    user = User.find_by email: params[:email]
    # If user exists and password is correct
    if user.present? && user.authenticate(params[:password])
      # Create session
      session[:user_id] = user.id 
      redirect_to(posts_path)
    else 
      # If user doesn't exist or password invalid
      flash[:error] = "Invalid email or password."
      redirect_to(login_path)
    end
  end # create

  # Logout -------------------------------------------
  def destroy
    session[:user_id] = nil
    redirect_to(login_path)
  end # destroy

end

class ApplicationController < ActionController::Base
  
  before_action :fetch_user

  # GET CURRENT USER --------------------------------------
  def fetch_user
    # If user_id in session is the ID in database, get @current_user object
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end
    # If empty session unless there is @current_user 
    session[:user_id] = nil unless @current_user.present?
  end # fetch_user

  # CHECK LOGIN -------------------------------------------
  def check_if_logged_in
    # If not logged in redirect to login page
    redirect_to(login_path) unless @current_user.present?
  end # check_if_logged_in

end

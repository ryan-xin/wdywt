class FollowsController < ApplicationController
  def new
  end

  def create
    @user = User.find params[:user_id]
    @current_user.following << @user
    redirect_to(request.referer)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    Follow.destroy params[:id]
    # HTTP referral header: the previous visted URL
    url = Rails.application.routes.recognize_path(request.referer)
    last_action = url[:action]
    # Comment on show page stay at show page
    if last_action == "show"
      redirect_to(request.referer + '#follow')     
      return
    end      
    # Comment on index page stay at index page
    redirect_to(request.referer)   
  end
end

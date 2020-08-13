class FollowsController < ApplicationController
  def new
  end

  def create
    raise "hell"
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
  end
end

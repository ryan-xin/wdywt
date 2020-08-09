class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params # Strong params

    # Check if the creation was successful
    if @user.persisted?
      session[:user_id] = @user.id 
      redirect_to(home_path)
    else
      render :new
    end

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


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

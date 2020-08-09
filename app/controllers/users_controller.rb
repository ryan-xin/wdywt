class UsersController < ApplicationController

  # CREATE -------------------------------------------
  def new
    @user = User.new
  end # new

  def create
    @user = User.create user_params # Strong params

    # Check if the creation was successful
    if @user.persisted?
      session[:user_id] = @user.id 
      redirect_to(posts_path)
    else
      render :new
    end
  end # create

  def index
  end

  def show
    @user = User.find params[:id]
  end # show
    
  def edit
    @user = User.find params[:id]
  end # edit

  def update
    @user = User.find params[:id]
    if @user.id != @current_user.id
      redirect_to(user_path(params[:id]))
      return
    end
    @user.update user_params_edit
    redirect_to(user_path(params[:id]))    
  end # update

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end # user_params

  def user_params_edit
    params.require(:user).permit(:image, :name, :email, :password, :password_confirmation, :bio)
  end # user_params_edit

end

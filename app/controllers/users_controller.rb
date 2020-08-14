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
      redirect_to(root_path)
    else
      render :new
    end
  end # create

  # READ -------------------------------------------
  def show
    @user = User.find params[:id]
  end # show
  
  # UPDATE -------------------------------------------
  def edit
    @user = User.find params[:id]
  end # edit

  def update
    @user = User.find params[:id]
    # Check if the user on his own profile page
    if @user.id != @current_user.id
      redirect_to(user_path(params[:id]))
      return
    end
    # Check if :name field is empty or not
    if params[:user][:name].present?
      if params[:file].present?
        # Actually forward upload file on to Cloudinary server
        response = Cloudinary::Uploader.upload params[:file]
        @user.image = response['public_id']
        @user.save
      end
      @user.update user_params_edit
      redirect_to(user_path(params[:id]))
    else
      # Save error message and send to template
      flash[:error] = "Name can't be blank."
      redirect_to(edit_user_path(params[:id])) 
    end
  end # update

  private

  # For user account create
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end # user_params

  # For user profile edit
  def user_params_edit
    params.require(:user).permit(:image, :name, :email, :password, :password_confirmation, :bio)
  end # user_params_edit

end

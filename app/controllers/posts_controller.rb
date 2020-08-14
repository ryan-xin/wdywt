class PostsController < ApplicationController

  before_action :check_if_logged_in

  # CREATE -------------------------------------------
  def new
    @post = Post.new
  end # new

  def create
    @post = Post.create post_params
    # Check if there is uploaded image
    if params[:file].present?
      # Actually forward upload file on to Cloudinary server
      response = Cloudinary::Uploader.upload params[:file]
      @post.image = response['public_id']
      @post.save
      @current_user.posts << @post
      redirect_to(posts_path)
    else 
      render :new
    end
  end # create

  # READ -------------------------------------------
  def index
    # DESC: show descending latest to oldest
    @posts = Post.all.order("created_at DESC")
    # Create comment on index page
    @comment = Comment.new
  end # index

  def show
    @post = Post.find params[:id]
    # Create comment on show page
    @comment = Comment.new
  end # show
  
  # UPDATE -------------------------------------------
  def edit
    @post = Post.find params[:id]
    # Check if @current_user is the @post.user
    if @post.user_id != @current_user.id
      redirect_to(posts_path)
    end
  end # edit

  def update
    @post = Post.find params[:id]
    # Check if @current_user is the @post.user
    if @post.user_id != @current_user.id
      redirect_to(posts_path)
      return
    end
    # Check if there is uploaded image
    if params[:file].present?
      # Actually forward upload file on to Cloudinary server
      response = Cloudinary::Uploader.upload params[:file]
      @post.image = response['public_id']
      @post.save
      @post.update post_params
      redirect_to(post_path(params[:id]))
    else
      # Save error message and send to template
      flash[:error] = "Image can't be blank."
      redirect_to(edit_post_path(params[:id]))
    end
  end # update

  # DESTROY -------------------------------------------
  def destroy
    Post.destroy params[:id]
    redirect_to(posts_path)
  end # destroy


  private

  def post_params
    params.require(:post).permit(:image, :description, :brand)
  end # post_params

end

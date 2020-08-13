class PostsController < ApplicationController

  before_action :check_if_logged_in

  # CREATE -------------------------------------------
  def new
    @post = Post.new
  end # new

  def create
    @post = Post.create post_params
    if params[:file].present?
      # Actually forward upload file on to Cloudinary server
      response = Cloudinary::Uploader.upload params[:file]
      @post.image = response['public_id']
      @post.save
      @current_user.posts << @post
      redirect_to(posts_path)
    else 
      # TODO: Error message not showing
      # raise "hell"
      redirect_to(new_post_path)
    end
  end # create

  # READ -------------------------------------------
  def index
    @posts = Post.all.order("created_at DESC")
    @comment = Comment.new
  end # index

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end
  
  # UPDATE -------------------------------------------
  def edit
    @post = Post.find params[:id]
    if @post.user_id != @current_user.id
      redirect_to(posts_path)
    end
  end # edit

  def update
    @post = Post.find params[:id]
    if @post.user_id != @current_user.id
      redirect_to(posts_path)
      return
    end
    # raise "hell"
    if params[:file].present?
      # Actually forward upload file on to Cloudinary server
      response = Cloudinary::Uploader.upload params[:file]
      @post.image = response['public_id']
      @post.save
      @post.update post_params
      redirect_to(post_path(params[:id]))
    else
      # TODO: Error message not showing
      # raise "hell"
      redirect_to(edit_post_path(params[:id]))
    end
  end # update

  # DESTROY -------------------------------------------
  def destroy
    Post.destroy params[:id]
    redirect_to(posts_path)
  end


  private

  def post_params
    params.require(:post).permit(:image, :description, :brand)
  end # post_params

end

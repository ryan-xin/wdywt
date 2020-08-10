class PostsController < ApplicationController

  before_action :check_if_logged_in

  # CREATE -------------------------------------------
  def new
    @post = Post.new
  end # new

  def create
    @post = Post.create post_params
    @current_user.posts << @post
    redirect_to(posts_path)
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
    @post.update post_params
    redirect_to(post_path(params[:id]))
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

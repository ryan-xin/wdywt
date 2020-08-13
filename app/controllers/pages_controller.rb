class PagesController < ApplicationController

  before_action :check_if_logged_in

  def welcome
  end

  def home
    # @posts = Post.all.order("created_at DESC")
    # @comment = Comment.new
    # unless @current_user.following.exists?
    #   redirect_to(posts_path)
    # end
    redirect_to(posts_path)
  end

  def following
    @posts = Post.all.order("created_at DESC")
    @comment = Comment.new
    unless @current_user.following.exists?
      redirect_to(posts_path)
    end    
  end

end

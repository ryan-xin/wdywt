class PagesController < ApplicationController

  before_action :check_if_logged_in

  def home
    # redirect_to post#index
    redirect_to(posts_path)
  end

  def following
    # show user's following's posts
    # DESC: show descending latest to oldest
    @posts = Post.all.order("created_at DESC")
    @comment = Comment.new
  end

end

class CommentsController < ApplicationController

  def new
    
  end

  def create
    @comment = Comment.create comment_params
    @current_user.comments << @comment
    redirect_to(posts_path)
  end # create

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to(post_path(comment.post_id))
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end


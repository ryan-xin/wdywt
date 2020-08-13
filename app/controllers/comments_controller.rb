class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.create comment_params
    if @comment.persisted?
      @current_user.comments << @comment
      # Check if comment on post index or post show page
      # HTTP referral header: the previous visted URL
      url = Rails.application.routes.recognize_path(request.referer)
      last_action = url[:action]
      # Comment on show page stay at show page
      if last_action == "show"
        redirect_to(request.referer + '#end')     
        return
      end      
      # Comment on index page stay at index page
      redirect_to(request.referer + '#' + params[:comment][:post_id])
    else 
      raise "hell"
      render :new
    end
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
    # Redirect to post show page
    redirect_to(post_path(comment.post_id))
  end # destroy

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end # comment_params

end


class CommentsController < ApplicationController

  def create
    @comment = Comment.create comment_params
    # If @comment exists, assign to @current_user
    if @comment.persisted?
      @current_user.comments << @comment
    end
    # Check if comment on post index or post show page
    # HTTP referral header: the pre-visted URL
    url = Rails.application.routes.recognize_path(request.referer)
    last_action = url[:action]
    # Comment on show page stay at show page
    if last_action == "show"
      # Save error message and send to template
      flash[:error] = @comment.errors.full_messages.first
      redirect_to(request.referer + '#end')     
      # return
    else
      # Save error message and @comment.post_id send to template. Tells the template where to show the error message
      flash[:error] = @comment.errors.full_messages + [@comment.post_id]
      # Comment on index page stay at index page and position to the post
      redirect_to(request.referer + '#' + params[:comment][:post_id])
    end
  end # create

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


class LikesController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @post.likes.create(user_id: @current_user.id)
    # HTTP referral header: the previous visted URL
    url = Rails.application.routes.recognize_path(request.referer)
    last_action = url[:action]
    # Like on show page stay at show page
    if last_action == "show"
      redirect_to(request.referer + '#start')     
      return
    end      
    # Like on index page stay at index page
    redirect_to(request.referer + '#' + params[:post_id])
  end # create

  def destroy
    Like.destroy params[:id]
    # HTTP referral header: the previous visted URL
    url = Rails.application.routes.recognize_path(request.referer)
    last_action = url[:action]
    # Like on show page stay at show page
    if last_action == "show"
      redirect_to(request.referer + '#start')     
      return
    end      
    # Like on index page stay at index page
    redirect_to(request.referer + '#' + params[:post_id])
  end # destroy

end

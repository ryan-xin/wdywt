class SavesController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @current_user.saved_posts << @post
    # HTTP referral header: the previous visted URL
    url = Rails.application.routes.recognize_path(request.referer)
    last_action = url[:action]
    # Save on show page stay at show page
    if last_action == "show"
      redirect_to(request.referer + '#start')     
      return
    end      
    # Save on index page stay at index page
    redirect_to(request.referer + '#' + params[:post_id])
  end # create

  def destroy
    @current_user.saved_posts.delete Post.find(params[:post_id])
    # HTTP referral header: the previous visted URL
    url = Rails.application.routes.recognize_path(request.referer)
    last_action = url[:action]
    # Save on show page stay at show page
    if last_action == "show"
      redirect_to(request.referer + '#start')     
      return
    end      
    # Save on index page stay at index page
    redirect_to(request.referer + '#' + params[:post_id])
  end # destroy
end

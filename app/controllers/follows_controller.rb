class FollowsController < ApplicationController

  def create
    @user = User.find params[:user_id]
    @current_user.following << @user
    # Follow on differen pages: posts#show & profile, after follow stay at the relative page
    # HTTP referral header: the previous visted URL
    redirect_to(request.referer)
  end

  def destroy
    Follow.destroy params[:id]
    # Follow on differen pages: posts#show & profile, after follow stay at the relative page
    # HTTP referral header: the previous visted URL
    redirect_to(request.referer)   
  end
end

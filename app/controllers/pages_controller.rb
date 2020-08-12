class PagesController < ApplicationController

  before_action :check_if_logged_in

  def welcome
    redirect_to(posts_path)
  end

  def home
  end

end

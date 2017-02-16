class HomeController < ApplicationController
  include SessionsHelper
  def index
    # unless session[:user_id].nil?
    #   unless current_user.nil?
    #       log_out
    #       redirect_to root_path
    #   else
    #   redirect_to current_user
    #   end
    # else
    @user = User.new
    @current_user = current_user
      @posts = Post.order(id: :desc)
    # end
  end
end

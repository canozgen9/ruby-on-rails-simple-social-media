class PostsController < ApplicationController
  include SessionsHelper
  def create
    @current_user = current_user
    @current_user.posts.create(post_params)
    flash["success"] = "Your post successfully sent."
    redirect_to @current_user
  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

end

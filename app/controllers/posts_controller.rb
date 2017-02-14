class PostsController < ApplicationController
  include SessionsHelper
  def create
    @current_user = current_user
    flash["success"] = "Your post successfully sent."
    respond_to do |format|
      if (@post = @current_user.posts.create(post_params))
        format.html { redirect_to request.fullpath, notice: 'post was succesfully created.'}
        format.json { render :show,status: :created,location: @post }
        format.js
      else

      end
    end
  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

end

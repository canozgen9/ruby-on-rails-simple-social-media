class LikesController < ApplicationController
  include SessionsHelper
  def create
    @like = Like.new
    @like.post_id = params[:post_id]
    @like.user_id = params[:user_id]
    @post = Post.find(params[:post_id])
    respond_to do |format|
      if @like.save
        format.html { redirect_to request.fullpath, notice: 'post was succesfully created.'}
        format.json { render :show,status: :created,location: @like }
        format.js
      else

      end
    end

  end

  def destroy
    like = Like.find_by post_id: params[:post_id]
    like = like.find_by user_id: params[:user_id]
    if like.destroy
      flash['success'] = "You like is removed."
    else
      flash['danger'] = "Your like isn't removed."
    end
    redirect_to current_user
  end
end

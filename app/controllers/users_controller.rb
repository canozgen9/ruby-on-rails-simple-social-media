class UsersController < ApplicationController

  def show
    @current_user = User.find(session[:user_id])
    @posts = Post.order(id: :desc)
    @like = Like.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash["success"] = "Your acoount is succesfully created! Login and start now!"
      redirect_to root_path;
    else
      flash["danger"] = "Please check your informations."
      redirect_to root_path;
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :age, :sex,:avatar)
  end
end

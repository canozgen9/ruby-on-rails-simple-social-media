class SessionsController < ApplicationController
  include SessionsHelper
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash["success"] = "Welcome "+user.name+"!"
      flash["info"] = "Create posts and share your ideas to others."
      redirect_to user
    else
      flash["danger"] = "Invalid email/password combination."
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end

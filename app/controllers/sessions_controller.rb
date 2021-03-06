class SessionsController < ApplicationController

  def new
    @user = User.new
    # render :new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    user = @user.authenticate(params[:user][:password])
    if user
      self.current_user = user
      redirect_to root_path, notice: "You. Made it."
    else
      flash.now.alert = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(username: params[:session][:user])

    if @user
      session[:username] = @user.username
      flash[:success] = 'successfully signed in'
      redirect_to root_path
    else
      flash.now[:danger] = 'Something went wrong...'
      render 'new'
    end
  end

  def destroy
  	session[:username] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to sign_in_path
  end
end

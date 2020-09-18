class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(signup_params)
    if @user.save
      session[:username] = @user.username
      flash[:notice] = 'Account is created sucessfully'
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong...'
      render new_user_path
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    @opinion = Opinion.new
    @opinions = @user.opinions.order_by_most_recent
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(signup_params)
    if @user.save
      flash[:notice] = 'profile updated!'
      redirect_to root_path(current_user)
    else
      flash[:alert] = 'Something went wrong ...'
      render 'edit'
    end
  end

  private

  def signup_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end

class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(signup_params)
    if @user.save
      flash[:success] = 'Account is created sucessfully'
    else
      flash[:danger] = 'Something went wrong...'
      render 'new'
    end
  end

  def show
  	@user = User.find(username: params[:username])
  end

  def edit
  end

  def update
  end

  private

  def signup_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end

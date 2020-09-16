class FollowingsController < ApplicationController
  def create
  	@following = current_user.followings.new(followed_id: params[:user_id])
  	if @following.save
  	  flash[:notice] = "You are following #{User.find(params[:user_id]).fullname}"
  	else
  	  flash[:alert] = 'Something went wrong ...'
  	end
  	redirect_to root_path
  end
end

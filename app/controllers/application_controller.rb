class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:username]) if session[:username]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:danger] = 'Log in to perform this action'
    redirect_to sign_in_path
  end
end

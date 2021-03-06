class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
	@current_user ||= User.find(session[:user_new]) if session[:user_id]
  end

  def logged_in?
	current_user.present?
  end
  helper_method :current_user, :logged_in?

end

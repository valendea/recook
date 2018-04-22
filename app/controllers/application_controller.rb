class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :person, contains: [:user]
  before_action :authenticate_user!

  # private
  # def current_user
  # 	if session[:user_id]
  # 		@current_user ||= User.find_by_id(session[:user_id])
  # 	end
  # end

  # Returns true if current_user exists, false otherwise
  # def logged_in?
  # 	!current_user.nil?
  # end

  # helper_method :logged_in?, :current_user
end

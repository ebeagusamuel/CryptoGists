class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def authenticate_user
    return unless current_user.nil?

    flash.notice = 'You need to login'
    redirect_to login_path
  end
end

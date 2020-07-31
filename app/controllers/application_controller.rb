class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def confirm_login
    @user = User.find_by(username: params[:username])
    if @user.nil?
      flash.notice = 'Username not found'
      redirect_to login_path
    else
      session[:current_user_id] = @user.id
      flash.notice = 'Login successful'
      redirect_to root_path
    end
  end

  def authenticate_user
    return unless current_user.nil?

    flash.notice = 'You need to login'
    redirect_to login_path
  end
end

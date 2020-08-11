class SessionsController < ApplicationController
  before_action :authenticate_user, except: %i[login]
  def login; end

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

  def logout
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end
end

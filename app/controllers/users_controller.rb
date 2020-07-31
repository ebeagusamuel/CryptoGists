class UsersController < ApplicationController
  before_action :authenticate_user, except: %i[login new create]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'User created successfully'
    else
      flash.notice = 'Was not able to create new user!'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.notice = 'Your details have been updated suceesfully'
      redirect_to root_path
    else
      flash.notice = "Couldn't update your details!"
      render :edit
    end
  end

  def login; end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :profile_image, :cover_image, :id)
  end
end

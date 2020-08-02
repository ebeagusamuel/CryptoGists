class UsersController < ApplicationController
  before_action :authenticate_user, except: %i[login new create destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_user

  def index
    @users = User.exclude_current_user(current_user)
    @gists = Gist.all.order('created_at DESC')
    @gist = Gist.new
  end

  def show
    @user = User.find(params[:id])
    @users = User.followed_by(@user)
    @gists = @user.gists.order('created_at DESC')
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

  def logout
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end

  def follow
    req = current_user.followings.build(follower_id: params[:user_id])

    if req.save
      flash.notice = "You have followed #{User.find(params[:user_id]).name}"
      redirect_to root_path
    else
      flash.notice = 'follow not successful!'
      redirect_to root_path
    end
  end

  def unfollow
    req = Following.find_by(user_id: current_user.id, follower_id: params[:user_id])
    req.destroy
    flash.notice = "You have unfollowed #{User.find(params[:user_id]).name}"
    redirect_to root_path
  end

  # def destroy
  #   @_current_user = session[:current_user_id] = nil
  #   redirect_to root_url
  # end

  private

  def user_params
    params.require(:user).permit(:name, :username, :profile_image, :cover_image, :id)
  end

  def invalid_user
    logger.error "Attempt to access invalid user #{params[:id]}"
    redirect_to root_path, notice: 'Invalid user!'
  end
end

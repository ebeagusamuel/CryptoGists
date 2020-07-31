class UsersController < ApplicationController
  before_action :authenticate_user, except: [:login]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def login; end

  private

  def user_params
    params.require(:user).permit(:name, :username, :profile_image, :cover_image, :id)
  end

end

class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def login; end

end

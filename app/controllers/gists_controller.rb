class GistsController < ApplicationController
  before_action :authenticate_user

  def index
    @gists = Gist.all.order('created_at DESC')
    @users = User.who_to_follow(current_user)
    @gist = Gist.new
  end

  def create
    @gist = current_user.gists.build(gist_params)
    if @gist.save
      redirect_to root_path, notice: 'Gist posted successfully'
    else
      render :index, notice: 'Gist was not posted!'
    end
  end

  private

  def gist_params
    params.require(:gist).permit(:id, :body)
  end
end

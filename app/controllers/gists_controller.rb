class GistsController < ApplicationController
  before_action :authenticate_user

  def index
    @gists = Gist.includes(%i[author comments]).order('created_at DESC')
    @users = User.includes(:profile_image_attachment).who_to_follow(current_user)
    @gist = Gist.new
  end

  def create
    @gist = current_user.gists.build(gist_params)
    if @gist.save
      flash.notice = 'Gist posted successfully'
      redirect_to root_path
    else
      flash.alert = @gist.errors.full_messages.join('. ').to_s
      redirect_to gists_path
    end
  end

  private

  def gist_params
    params.require(:gist).permit(:id, :text)
  end
end

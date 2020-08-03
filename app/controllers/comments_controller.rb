class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.gist_id = params[:gist_id]
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to root_path, notice: 'Comment was successfully created.'
    else
      redirect_to gists_path, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

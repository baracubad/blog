class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to request.referrer, notice: "Your comment was successfully posted."
  end


  def destroy
      @comment = @commentable.comments.find(params[:id])
      @comment.destroy
    redirect_to request.referrer
  end


  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
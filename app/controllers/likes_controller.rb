class LikesController < ApplicationController
  before_action :authenticate_user!
    
  def create
    if already_liked?
        flash[:notice] = "You can't like more than once"
      else
        @likeable.likes.create(user_id: current_user.id)
      end
      redirect_to request.referrer
    end

  def destroy
    if already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like = @likeable.likes.find(params[:id])
      @like.destroy
    end
    redirect_to request.referrer
  end

  private


  def already_liked?
    Like.where(user_id: current_user.id, likeable_id: @likeable_id, likeable_type: @likeable_type).exists?
  end
end

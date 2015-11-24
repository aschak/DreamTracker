class UserCommentsController < ApplicationController

  before_action :require_user!


  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.author_id = current_user.id

    @user_comment.save
    flash[:errors] = @user_comment.errors.full_messages
    user_id = user_comment_params[:user_id]
    redirect_to user_url(user_id)
  end

  def destroy
    user_comment = UserComment.find(params[:id])
    user_comment.destroy
    redirect_to user_url(user_comment.user_id)
  end


  private
  def user_comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end
end

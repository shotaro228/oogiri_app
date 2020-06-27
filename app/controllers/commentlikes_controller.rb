class CommentlikesController < ApplicationController
  before_action :authenticate_user
  
  def create
    @commentlike = Commentlike.new(
      user_id: @current_user.id,
      comment_id: params[:comment_id]
      )
    @commentlike.save
    redirect_to("/answers/#{@commentlike.comment.answer_id}")
  end
  
  def destroy
    @commentlike = Commentlike.find_by(
      user_id: @current_user.id,
      comment_id: params[:comment_id]
      )
    @commentlike.destroy
    redirect_to("/answers/#{@commentlike.comment.answer_id}")
  end
end

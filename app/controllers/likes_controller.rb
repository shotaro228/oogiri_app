class LikesController < ApplicationController
  before_action :authenticate_user
  
  def create
    @like = Like.new(
      user_id: @current_user.id,
      answer_id: params[:answer_id]
    )
    @like.save
    redirect_to("/answers/#{params[:answer_id]}")
  end
  
  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      answer_id: params[:answer_id]
      )
    @like.destroy
    redirect_to("/answers/#{params[:answer_id]}")
  end
end

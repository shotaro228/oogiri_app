class FollowsController < ApplicationController
  before_action :set_user

  def create
    following = @current_user.follow(@user)
    if following.save
      flash[:warning] = 'ユーザーをフォローしました'
      redirect_to("/users/#{@user.id}")
    else
      flash[:danger] = 'ユーザーのフォローに失敗しました'
      redirect_to("/users/#{@user.id}")
    end
  end

  def destroy
    following = @current_user.unfollow(@user)
    if following.destroy
      flash[:warning] = 'ユーザーのフォローを解除しました'
      redirect_to("/users/#{@user.id}")
    else
      flash[:danger] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to("/users/#{@user.id}")
    end
  end

  private
  def set_user
    @user = User.find_by(id: params[:follow_id])
  end

end

class AnswersController < ApplicationController
  
  before_action :authenticate_user
  before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}
  
  
  def index
    @answers = Answer.all.order(created_at: :desc)
  end
  
  def new
    @answer = Answer.new
  end
  
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:warning] ="回答しました"
      redirect_to("/answers")
    else
      flash[:danger] = "内容を1文字以上140字以内で入力してください"
      render("answers/new")
    end
  end
  
  def show
    @answer = Answer.find_by(id: params[:id])
    @user = @answer.user
    @comments = @answer.comments
    @comments_count = @answer.comments.count
    @likes_count= @answer.likes.count
  end
  
  def edit
    @answer = Answer.find_by(id: params[:id])
  end
  
  def update
    if @answer.update(answer_params)
      flash[:warning] = "回答を編集しました"
      redirect_to("/answers")
    else
      flash[:danger] = "編集に失敗しました"
      render("answers/edit")
    end
  end
  
  def destroy
    @answer = Answer.find_by(id: params[:id])
    @answer.destroy
  end
  
  def ensure_correct_user
    @answer= Answer.find_by(id: params[:id])
    if @answer.user_id!=@current_user.id
      flash[:danger]="権限がありません"
      redirect_to("/answers")
    end
  end
  
  def liked
    @answer = Answer.find_by(id: params[:id])
    @likes = @answer.likes
  end
  
  def commented
    @answer = Answer.find_by(id: params[:id])
    @comments = @answer.comments
  end
  
  private
  def answer_params
    params.require(:answer).permit(:content).merge(user_id: @current_user.id)
  end
end

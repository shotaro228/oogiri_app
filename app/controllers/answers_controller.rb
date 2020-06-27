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
    @answer = Answer.new(
      content: params[:content],
      user_id: @current_user.id
      )
    if @answer.save
      flash[:warning] ="回答しました"
      redirect_to("/")
    else
      flash[:danger] = "内容を1文字以上140字以内で入力してください"
      render("answers/new")
    end
  end
  
  def show
    @answer = Answer.find_by(id: params[:id])
    @user = @answer.user
    @likes_count=Like.where(answer_id: @answer.id).count
  end
  
  def edit
    @answer = Answer.find_by(id: params[:id])
  end
  
  def update
    @answer = Answer.find_by(id: params[:id])
    @answer.content = params[:content]
    if @answer.save
      flash[:warning] = "回答を編集しました"
      redirect_to("/answers")
    else
      fladh[:danger] = "編集に失敗しました"
      render("answers/edit")
    end
  end
  
  def destroy
    @answer = Answer.find_by(id: params[:id])
    @answer.destroy
  end
  
  def rank
    @count = 20
  end
  
  def ensure_correct_user
    @answer=Answer.find_by(id: params[:id])
    if @answer.user_id!=@current_user.id
      flash[:danger]="権限がありません"
      redirect_to("/answers")
    end
  end
end

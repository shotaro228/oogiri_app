class CommentsController < ApplicationController
  
 before_action :authenticate_user
 before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}
   
  def new
    @comment = Comment.new
    @answer = Answer.find_by(id: params[:id])
  end
  
  def create
    @answer = Answer.find_by(id: params[:id])
    @comment = Comment.new(comment_params)
      if @comment.save
        flash[:warning] = "コメントしました"
        redirect_to("/answers/#{@comment.answer_id}")
      else
        flash[:danger] = "内容を0~140文字で入力してください"
        render("comments/new")
      end
  end
  
  def show
    @comment = Comment.find_by(id: params[:id])
  end
  
  def edit
    @comment = Comment.find_by(id: params[:id])
  end 
  
  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      flash[:warning] = "コメントを編集しました"
      redirect_to("/answers/#{@comment.answer_id}")
    else
      flash[:danger] = "編集できませんでした"
      render("comments/edit")
    end
  end
  
  def destroy
  end
  
  def ensure_correct_user
    @comment= Comment.find_by(id: params[:id])
    if @comment.user_id!=@current_user.id
      flash[:danger]="権限がありません"
      redirect_to("/answers")
    end
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: @current_user.id, answer_id: params[:id])
    
  end
end

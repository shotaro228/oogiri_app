class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @answer = Answer.find_by(id: params[:id])
  end
  
  def create
    @answer = Answer.find_by(id: params[:id])
    @comment = Comment.new(
      content: params[:content],
      user_id: @current_user.id,
      answer_id: params[:id]
    )
    
    if @comment.user_id ==  @answer.user_id
      flash[:danger] = "自分にはコメントできません"
      redirect_to("/answers/#{@comment.answer_id}")
    else
      if @comment.save
        flash[:warning] = "コメントしました"
        redirect_to("/answers/#{@comment.answer_id}")
      else
        flash[:danger] = "内容を0~140文字で入力してください"
        render("comments/new")
      end
    end
  end
  
  
  def edit
    @comment = Comment.find_by(id: params[:id])
  end 
  
  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.content = params[:content]
    
    if @comment.save
      flash[:warning] = "コメントを編集しました"
      redirect_to("/answers/#{@comment.answer_id}")
    else
      flash[:danger] = "編集できませんでした"
      render("comments/edit")
    end
  end
  
  def destroy
  end
  
end

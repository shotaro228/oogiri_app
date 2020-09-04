class QuestionsController < ApplicationController
  before_action :admin_user
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:warning] ="お題を作成しました"
      redirect_to("/answers")
    else
      render("questions/new")
    end
  end 
  
  def destroy
  end
  
  def set_today_question
     Question.update_all(today_flg: false)
     @question = Question.all.sample
     @question.today_flg = true
     @question.save
  end
  
  def question_params
    params.require(:question).permit(:content)
  end
end

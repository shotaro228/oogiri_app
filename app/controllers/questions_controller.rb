class QuestionsController < ApplicationController
  
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
  
  def question_params
    params.require(:question).permit(:content)
  end
end

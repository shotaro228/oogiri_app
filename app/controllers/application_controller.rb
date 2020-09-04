class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user, :find_today_question
  
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:warning] = "ログインが必要です"
      redirect_to("/")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:danger] = "既にログインしています"
      redirect_to("/answers")
    end
  end
  
  def admin_user
    redirect_to("/answers") unless @current_user.admin?
  end
  
  def find_today_question
    @today_question = Question.find_by(today_flg: true)
  end
  
end

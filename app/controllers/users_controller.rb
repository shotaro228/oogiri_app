class UsersController < ApplicationController
  before_action :authenticate_user, {only:[:edit, :update]}
  before_action :forbid_login_user, {only:[:new, :create, :login]}
  before_action :ensure_correct_user, {only:[:edit, :update]}
  
  def index
    @count = 20
  end
  
  def show
    @count = 20
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "test_icon.png"
      )
      if @user.save
        session[:user_id] = @user.id
        flash[:warning] = "ユーザー登録が完了しました"
        redirect_to("/answers")
      else
        render("users/new")
      end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    binding.pry
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.introduction = params[:introduction]
    if @user.save
      flash[:warning] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:warning] = "ログインに成功しました"
      redirect_to("/answers")
    else
      user = User.find_by(email: params[:email])
      if user 
        flash.now[:danger] = "パスワードが違います"
      else
        flash.now[:danger] = "存在しないアドレスです"
      end
      @email = params[:email]
      @password = params[:password]
      render("home/top")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:warning] = "ログアウトしました"
    redirect_to("/")
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to("answers")
    end
  end
end

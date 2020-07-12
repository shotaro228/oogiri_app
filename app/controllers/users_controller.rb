class UsersController < ApplicationController
  before_action :authenticate_user, {only:[:edit, :update]}
  before_action :forbid_login_user, {only:[:new, :create, :login]}
  before_action :ensure_correct_user, {only:[:edit, :update]}
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.image_name = "test_icon.png"
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
    @user = User.find_by(id: user_params[:id])
    @user.name = user_params[:name]
    @user.email = user_params[:email]
    @user.password = user_params[:password]
    @user.introduction = user_params[:introduction]
    if user_params[:image]
      @user.image_name = "#{@user.id}.png"
      image = user_params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    
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
  
  def followed
    @user = User.find_by(id: params[:id])
    @followers = @user.followers
  end
  
  def follow_to
    @user = User.find_by(id: params[:id])
    @followings = @user.followings
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:introduction,:image).merge(id: params[:id])
  end
end

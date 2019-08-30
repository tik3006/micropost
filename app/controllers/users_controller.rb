class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :folowings, :followers]
  
  #idの降順にユーザを取得し25件で表示する
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end
  
  #ユーザー名とGravatarの表示
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(id: :desc).page(params[:page])
    counts(@user)
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

  #ユーザーが保存された場合成功メッセージを表示しプロフィールに遷移する
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
  
  #失敗した場合失敗メッセージを表示し、新規登録画面へ戻される
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followings.page(params[:page])
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
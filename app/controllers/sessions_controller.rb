class SessionsController < ApplicationController
  def new
  end

  def create
   #emailを小文字化して取得する
    email = params[:session][:email].downcase
    password = params[:session][:password]
   
   #privateのloginの呼び出し
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

   def destroy
   #セッションにnilを代入しログアウトする
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
   end

 
  private

  def login(email, password)
   
   #emailと一致するユーザーを取得する
    @user = User.find_by(email: email)
   
    if @user && @user.authenticate(password)
      
      # ログイン成功の場合セッションにユーザーidを格納する
      session[:user_id] = @user.id
      return true
   
    else
      # ログイン失敗
      return false
    end
  end
end
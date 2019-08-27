module SessionsHelper
 
 #現在ログインしているユーザー情報を取得する
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #ログインしていたらTrueを返ししていなかったらFalseを返す
  def logged_in?
    !!current_user
  end
end

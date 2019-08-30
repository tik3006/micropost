class ApplicationController < ActionController::Base
  
  #SessionsHelperを取り込む
  include SessionsHelper
  
 private
 
 #ログインしていない場合ログイン画面に遷移させる
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  #投稿数、フォロー数、フォロワー数をカウントする
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
end
class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  
  def create
  #投稿を探す
  micropost = Micropost.find(params[:micropost_id])
  current_user.like(micropost)
  flash[:success] = 'お気に入りに追加しました。'
  redirect_back root_path
  end

  def destroy
  micropost = Micropost.find(params[:micropost_id])
  current_user.unlike(micropost)
  flash[:danger] = 'お気に入りを解除しました。'
  redirect_back root_path
  end
end

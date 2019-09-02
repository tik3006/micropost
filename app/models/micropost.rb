class Micropost < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 255 }
  
  #お気に入り機能中間テーブル
  has_many :favorites
  has_many :like_users, through: :favorites, source: :user

end
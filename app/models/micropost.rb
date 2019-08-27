class Micropost < ApplicationRecord
  belongs_to :user
  
  #投稿の文字数を最大255文字にする
  validates :content, presence: true, length: { maximum: 255 }
  
end
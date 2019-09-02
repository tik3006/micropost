class Favorite < ApplicationRecord
  belongs_to :user
  #参照の明示
  belongs_to :micropst,class_name: 'User'
end

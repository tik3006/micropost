class Favorite < ApplicationRecord
 belongs_to :micropost,class_name: 'Micropost'
 #belongs_to :micropost,class_name: 'User'
 
end

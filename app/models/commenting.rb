class Commenting < ActiveRecord::Base
 # #7
   belongs_to :commentable, polymorphic: true
   belongs_to :comment
  
 end

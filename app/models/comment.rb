class Comment < ActiveRecord::Base

  belongs_to :user


  has_many :commentings
  has_many :topics, through: :commentings, source: :commentable, source_type: :Topic
  has_many :posts, through: :commentings, source: :commentable, source_type: :Post


  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  #after_create :send_favourite_emails

   private

   #def send_favourite_emails
     #post.favourites.each do |favourite|
       #FavouriteMailer.new_comment(favourite.user, post, self).deliver_now
     #end
   #end
end

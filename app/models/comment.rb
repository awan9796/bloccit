class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :topic

  has_many :commentings
  has_many :topics, through: :commentings, source: :commentable, source_type: :Topic
  has_many :posts, through: :commentings, source: :commentable, source_type: :Post

  validates :body, length: { minimum: 0 }, presence: true
  validates :user, presence: true


  def self.update_comments(comment_string)
      return Comment.none if comment_string.blank?
      Comment.find_or_create_by(body: comment.strip)
    end
  end

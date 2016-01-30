class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, length: { minimum: 5 }
  validates :name, presence: true
  validates :description, length: { minimum: 25}
  validates :description, presence: true
end

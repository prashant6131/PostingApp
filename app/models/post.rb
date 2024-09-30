class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
    # A post can be liked by many users through likes
  # has_many :likers, through: :likes, source: :user
    # A post can have many commenters through comments
  # has_many :commenters, through: :comments, source: :user
  
  validates :title, presence: true
  validates :text, presence: true, length: { minimum: 10 }
end

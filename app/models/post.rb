class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  def self.trend
    select('posts.*, COUNT(likes.id) AS likes_count').
        joins(:likes).
        group('posts.id').
        order('likes_count DESC').
        limit(5)
  end
end

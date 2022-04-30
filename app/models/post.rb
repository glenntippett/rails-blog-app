class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_rich_text :rich_body

  def liked?(user)
    !!likes.find { |like| like.user == user }
  end
end

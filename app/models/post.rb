class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_rich_text :rich_body

  def liked?(user)
    !!likes.find { |like| like.user == user }
  end
end

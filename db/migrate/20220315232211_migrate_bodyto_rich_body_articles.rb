class MigrateBodytoRichBodyArticles < ActiveRecord::Migration[6.1]
  def up
    Post.find_each do |post|
      post.update(rich_body: post.body)
    end
  end

  def down
    Post.find_each do |post|
      post.update(body: post.rich_body)
      post.update(rich_body: nil)
    end
  end
end

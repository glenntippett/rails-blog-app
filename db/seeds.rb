def clean_db
  puts 'Cleaning DB:'
  puts '1. Destroying Users...'
  User.destroy_all
  puts '2. Destroying Posts...'
  Post.destroy_all
  puts '3. Destroying Comments...'
  Comment.destroy_all
  puts 'Finished cleaning DB'
end

def create_test_user
  User.create!(
    {
      username: 'test',
      email: 'test@test.com',
      password: 'password123'
    }
  )
end

def create_users
  puts 'Creating users...'
  5.times do
    User.create!(
      {
        username: Faker::Internet.unique.username,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password
      }
    )
  end
  create_test_user
  puts '✅ Users created'
rescue StandardError => e
  puts "❌ Error creating users: #{e}"
end

def create_test_user_posts
  5.times do
    Post.create!(
      {
        user_id: User.find_by_email!('test@test.com').id,
        title: Faker::Movies::StarWars.quote,
        summary: Faker::TvShows::MichaelScott.quote,
        body: Faker::Lorem.paragraph(sentence_count: 4)
      }
    )
  end
end

def create_test_user_comments
  10.times do
    Comment.create!(
      {
        content: Faker::Lorem.sentence,
        user_id: User.find_by_email!('test@test.com').id,
        post_id: Post.first.id
      }
    )
  end
end

def create_posts
  puts 'Creating blog posts...'
  20.times do
    Post.create!(
      {
        user_id: User.find(User.pluck(:id).sample).id,
        title: Faker::Movies::StarWars.quote,
        summary: Faker::TvShows::MichaelScott.quote,
        body: Faker::Lorem.paragraph(sentence_count: 4)
      }
    )
  end
  create_test_user_posts
  puts '✅ Posts created'
rescue StandardError => e
  puts "❌ Error creating posts: #{e}"
end

def create_comments
  puts 'Creating comments...'
  30.times do
    Comment.create!(
      {
        content: Faker::Lorem.sentence,
        user_id: User.find(User.pluck(:id).sample).id,
        post_id: Post.find(Post.pluck(:id).sample).id
      }
    )
  end
  create_test_user_comments
  puts '✅ Comments created'
rescue StandardError => e
  puts "❌ Error creating comments: #{e}"
end

clean_db
create_users
create_posts
create_comments

puts 'All done'

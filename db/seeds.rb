def clean_db
  puts 'Cleaning DB:'
  puts '1. Destroying Users...'
  User.destroy_all
  puts '2. Destroying Posts...'
  Post.destroy_all
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
  begin
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
    create_test_user()
    puts '✅ Users created'
  rescue => e
    puts "❌ Error creating users: #{e}"
  end
end

def create_test_user_posts
  5.times do Post.create!(
      {
        user_id:User.find_by_email!('test@test.com').id,
        title: Faker::Movies::StarWars.quote,
        summary: Faker::TvShows::MichaelScott.quote,
        body: Faker::Markdown.sandwich(sentences: 5)
      }
    )
  end
end

def create_posts
  begin
    puts 'Creating blog posts...'
    20.times do
      Post.create!(
        {
          user_id: User.find(User.pluck(:id).sample).id,
          title: Faker::Movies::StarWars.quote,
          summary: Faker::TvShows::MichaelScott.quote,
          body: Faker::Markdown.sandwich(sentences: 5)
        }
      )
    end
    create_test_user_posts()
    puts '✅ Posts created'
  rescue => e
    puts "❌ Error creating posts: #{e}"
  end
end

clean_db()
create_users()
create_posts()

puts 'All done'

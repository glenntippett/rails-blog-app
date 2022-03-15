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
        title: Faker::Lorem.sentence,
        summary: Faker::Lorem.paragraphs(number: 1),
        body: Faker::Lorem.paragraphs(number: 4)
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
          title: Faker::Lorem.sentence,
          summary: Faker::Lorem.paragraphs(number: 1),
          body: Faker::Lorem.paragraphs(number: 4)
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

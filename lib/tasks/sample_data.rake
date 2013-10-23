namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_teams
    make_teammembers
  end
end

def make_users
  10.times do |n|
    username = "user#{n}"
    fullname = Faker::Name.name
    password = "1"
    avatar_url = "http://lorempixel.com/300/300/people/#{n}"
    User.create!(username: username,
     fullname:   fullname,
     age:        rand(10..130).to_i,
     avatar_url: avatar_url,
     password:   password,
     password_confirmation: password)
  end

  10.times do |n|
    username = Faker::Internet.user_name
    username = "#{username}#{n}"
    fullname = Faker::Name.name
    password = "1"
    avatar_url = "http://lorempixel.com/300/300/food/#{n}"
    User.create!(username: username,
     fullname:   fullname,
     age:        rand(10..130).to_i,
     avatar_url: avatar_url,
     password:   password,
     password_confirmation: password)
  end

  10.times do |n|
    username = Faker::Internet.user_name
    username = "#{username}#{n}"
    fullname = Faker::Name.name
    password = "1"
    avatar_url = "http://lorempixel.com/300/300/business/#{n}"
    User.create!(username: username,
     fullname:   fullname,
     age:        rand(10..130).to_i,
     avatar_url: avatar_url,
     password:   password,
     password_confirmation: password)
  end

  10.times do |n|
    username = Faker::Internet.user_name
    username = "#{username}#{n}"
    fullname = Faker::Name.name
    password = "1"
    avatar_url = "http://lorempixel.com/300/300/fashion/#{n}"
    User.create!(username: username,
     fullname:   fullname,
     age:        rand(10..130).to_i,
     avatar_url: avatar_url,
     password:   password,
     password_confirmation: password)
  end

  def make_teams
    users = User.all(limit: 10)
    2.times do |n|     
      users.each { |user| 
       name = Faker::Internet.domain_word().capitalize
       name = "#{name}#{n*user.id}"

       team = user.teams.create!(name: name)
     }
   end
 end

 def make_teammembers
  teams = Team.all(limit: 10)
  users = User.all(limit: 15)
  teams.each { |team|
    users.each { |user|
      team.join!(user)
    }
  }
  end

end
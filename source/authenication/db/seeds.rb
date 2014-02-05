require 'faker'

User.create(name: 'Spencer', email: "spencer@example.com", password_hash: "admin")

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password_hash => 'password'
5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password_hash => Faker::Lorem.word
end

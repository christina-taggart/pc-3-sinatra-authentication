require 'faker'


#TODO: Once you have implemented BCrypt - you can use these to seed your database.


# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
# 5.times do
#   User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
# end
class SeedUsers
		test_user = User.new(name:'Darcey', email: 'darcey@awesome.com', password: 'asdf')
		test_user.save
		5.times { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.word) }

	
end


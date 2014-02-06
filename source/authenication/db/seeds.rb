require 'faker'


5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password_hash => BCrypt::Password.create(((Faker::Lorem).words),cost: 5)
end

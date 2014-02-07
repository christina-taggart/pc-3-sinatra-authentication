require 'bcrypt'
#User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
class User < ActiveRecord::Base
  include BCrypt

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end
end
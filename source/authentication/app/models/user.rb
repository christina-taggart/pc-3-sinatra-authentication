require 'bcrypt'
  
class User < ActiveRecord::Base
	validates :email, uniqueness: true

include BCrypt

	def password
	  @password ||= Password.new(password_hash)
	end

	def password=(new_password)
	  @password = Password.create(new_password)
	  self.password_hash = @password
	end

	def self.create(params)
	    user = User.new(params)
	    user.password = params[:password]
	    user.save!
	end
end


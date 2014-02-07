class User < ActiveRecord::Base
	
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  attr_accessor :password
  before_save :hash_password	

  def authenticate(password) 
  	password == BCrypt::Password.new(self.password_hash)
  end

  def hash_password
	  self.password_hash = BCrypt::Password.create(self.password)
  end
end 





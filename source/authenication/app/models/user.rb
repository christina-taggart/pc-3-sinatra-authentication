class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  before_validation :encrypt_password

  def encrypt_password
    self.password_hash = BCrypt::Password.create(password_hash)
  end

  def authenticate_user(password)
    BCrypt::Password.new(self.password_hash) == password
  end
end

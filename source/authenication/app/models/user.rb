class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  before_validation :encrypt_password

  def encrypt_password(password)
    BCrypt::Password.create(password)
  end
end

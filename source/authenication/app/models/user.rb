class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  before_validation :hash_the_password

  def hash_the_password
    # hash user password
  end
end

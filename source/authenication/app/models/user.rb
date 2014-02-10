require 'bcrypt'

class User < ActiveRecord::Base
    # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def check(incoming)
    p @new_pw = Password.new(incoming)
    p self.password_hash == @new_pw
  end

end








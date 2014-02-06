class User < ActiveRecord::Base
	include BCrypt

  # def create
  #   @user = User.new(params[:user])
  #   @user.password_hash = params[:password]
  #   @user.save!
  # end

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
  #TODO : Use bcrypt to store hashed passwords and authenticate users
end

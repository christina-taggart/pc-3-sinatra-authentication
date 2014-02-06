require 'bcrypt'

class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  include BCrypt

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end


  def create
  	@user = User.new(params[:user])
  	@user.password = params[:password]
  	@user.save!
  end

  def login
  	@user = User.find_by_email(params[:email])
  	if @user.password == params[:password]
  		give_token
  	else
  		redirect_to home_url
  	end
  end
  
end



class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create_secure(params)
    user = User.new(params)
    user.password = params[:password]
    user.save
    user
  end
end
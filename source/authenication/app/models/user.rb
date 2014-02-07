class User < ActiveRecord::Base
  include BCrypt
  validates :email, uniqueness: true
  validates :name, :email, :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create_encryption(params)
    user = User.new(params)
    user.password = params[:password]
    user.save
    user
  end
end

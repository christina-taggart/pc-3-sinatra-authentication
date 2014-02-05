class User < ActiveRecord::Base
  validates :email, uniqueness: true
  before_save :encrypt

  def self.authenticate_password(email, password_hash)
    User.where(email: email, password_hash: BCrypt::Password.is_password?(password_hash))
  end

  private

  def encrypt
    self.password_hash = BCrypt::Password.create(self.password_hash, cost: 10)
  end
end

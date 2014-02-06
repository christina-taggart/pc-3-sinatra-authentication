class User < ActiveRecord::Base
  validates :email, uniqueness: true
  before_save :encrypt
  before_create :encrypt

  def self.authenticate_password(email, password_plain_text)
    encrypted_password = self.encrypt(password_plain_text)
    User.where(email: email, password_hash: encrypted_password).first
  end

  def self.encrypt(password_plain_text)
    f = BCrypt::Password.create(password_plain_text, cost: 10)
    f.hash
  end

  private

  def encrypt
    self.class.encrypt(password_hash)
  end
end

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  before_save :encrypt_email

  def self.authenticate(email, password)
    !User.where(email: email, password_hash: Digest::SHA256.hexdigest(password)).empty?
  end

  def encrypt_email
    self.password_hash = Digest::SHA256.hexdigest(self.password_hash)
  end
end

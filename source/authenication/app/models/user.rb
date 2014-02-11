require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :original_password
  validates :password_hash, presence: true
  validates :original_password, length: { minimum: 6 }
  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "must be a valid email address like: name@example.com" }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def original_password
    @original_password = self.password
  end

end

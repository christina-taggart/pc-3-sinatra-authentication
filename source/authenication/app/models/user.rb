class User < ActiveRecord::Base
	attr_accessor :pre_password, :password

	validates :pre_password, presence: true, :length => {:minimum => 6}

	validates :email, presence: true, :format => { :with => /^.+@.+\..+$/, :message => "Not valid email address"}

  after_validation :encrypt_password

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def encrypt_password
    self.password = @pre_password
  end
end

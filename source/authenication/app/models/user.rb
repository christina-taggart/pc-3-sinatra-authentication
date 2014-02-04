class User < ActiveRecord::Base
	attr_accessor :pre_password, :password

	validates_presence_of :pre_password, :message => "Password can't be blank"
  validates :pre_password, :length => {:minimum => 6, :message => "Password must be at least 6 digits"}

	validates_presence_of :email, :message => "Email address can't be black"
  validates :email, :format => { :with => /^.+@.+\..+$/, :message => "Email address not valid"}
  validates_uniqueness_of :email, :message => "Email has already been used"

  validates_presence_of :name, :message => "Name can't be blank"

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

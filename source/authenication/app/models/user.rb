class User < ActiveRecord::Base
  validates_presence_of :name, :message=>"Umm, whats your name?"
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_hash, presence: true
  validates :password_hash, length: {minimum: 6}
  before_save :encrypt_password


  def self.validate(params, password)
    begin
      user_password = User.find_by_email(params[:email]).password_hash
      user_password == password
    rescue
      false
    end
  end

  def encrypt_password
    self.password_hash = Digest::SHA256.hexdigest(self.password_hash)
  end


end

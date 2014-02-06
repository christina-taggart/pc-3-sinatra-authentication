class User < ActiveRecord::Base
  @users= User.all
  @password= BCrypt::Password.create(params[:password])
end

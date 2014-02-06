helpers do

  include BCrypt

  def current_user
     # TODO: return the current user if there is a user signed in.
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:logged_in] = true
      session[:message] = nil
      erb :index
    else
      # session[:logged_in] = false
      session[:message] = "Your password and/or username was wrong.  Sucks to be you."
      erb :sign_in
    end
  end

end

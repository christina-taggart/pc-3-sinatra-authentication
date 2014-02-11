helpers do

  def current_user
      #returns the current user if there is a user signed in.
      User.find(session[:id]) if session[:id]
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:id] = @user.id
    end
  end

  def logout
    session[:id] = nil
  end

end

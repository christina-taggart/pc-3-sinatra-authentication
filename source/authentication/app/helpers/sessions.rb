helpers do

  def current_user
    User.find(session[:id]) if session[:id]
  end

  def login
    if @user.password == params[:password]
      session[:id] = @user.id
    end
  end

end

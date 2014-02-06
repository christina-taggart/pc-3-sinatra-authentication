helpers do

  def current_user
      User.where(email: session[:user_name]).first if session[:logged_in]
  end

end

helpers do

  def current_user
        # TODO: return the current user if there is a user signed in.
        User.where(email: session[:email]).first if session[:logged_in]
  end

end

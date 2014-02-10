helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    User.find(session[:id]) if session[:id]

  end

end

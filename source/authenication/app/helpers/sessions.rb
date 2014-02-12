helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    if session[:id]
      User.find(session[:id])
    end
  end

end

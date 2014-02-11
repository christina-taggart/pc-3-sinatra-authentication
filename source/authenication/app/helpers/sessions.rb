helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    if @user
      User.find(session[:id])
    end
  end

end

helpers do

  def current_user
        # TODO: return the current user if there is a user signed in.
    session[:id] ? @logged_in = true : @logged_in = false
    @user = User.find(session[:id]) if @logged_in
  end

end

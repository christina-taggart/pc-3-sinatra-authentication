helpers do

  def current_user
    if @logged_in
      User.find(session[:id])
    end
  end

end

helpers do

  def current_user
    if session[:id]
      User.find(session[:id]) 
    end
  end

end

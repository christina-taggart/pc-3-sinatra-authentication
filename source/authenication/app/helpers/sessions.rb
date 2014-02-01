helpers do

  def current_user
    begin
      User.find(session[:user_id])
    rescue
      nil
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
  end

  def sign_in
    session[:user_id] = @user.id
  end

  def redirect_to_proper_page
    if @user.password == params[:password]
      sign_in
      redirect '/'
    else
      redirect '/sessions/new'
    end
  end

end

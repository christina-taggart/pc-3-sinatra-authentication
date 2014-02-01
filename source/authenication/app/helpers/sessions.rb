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

  def assign_user
    @user = User.find_by_email(params[:email])
  end

  def authorized_redirect(auth_route, non_auth_route)
    if @user.password == params[:password]
      sign_in
      redirect auth_route
    else
      redirect non_auth_route
    end
  end

end

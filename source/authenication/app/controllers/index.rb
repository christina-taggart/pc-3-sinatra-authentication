get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 	@users = User.all
 	@user = User.find(session[:user_id]) if session[:user_id]
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/"
  else
    redirect back
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked 
  session.delete(:user_id)
  redirect "/"
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user = params[:user]
  pass = user.delete("password")
  @user = User.new(user)
  @user.password = pass
  if @user.save
  	redirect "/"
  else
  	redirect back
  end
end

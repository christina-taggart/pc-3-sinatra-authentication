before do
  if session[:id]
    @logged_in = true
    @current_user = User.find(session[:id])
  else
    @logged_in = false
  end
  @error = session[:error]
  session[:error] = nil
end

get '/' do
  @users = User.all if @logged_in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  unless user
    session[:error] = "Email Not Found"
    redirect '/sessions/new'
  end
  if user.password == params[:password]
    session[:id] = user.id
  else
    session[:error] = "Password Incorrect"
    redirect '/sessions/new'
  end
  redirect '/'
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  session[:id] = User.create_secure(params[:user]).id
  redirect '/'
end

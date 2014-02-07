#enable sessions

before do
	if session[:id]
		@logged_in = true
	else
  	@logged_in = false
  end
end

get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.authenticate_password(params[:email], params[:password])
  session[:id] = user.id
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
  session[:id] = User.create_encryption(name: params[:user_name], email: params[:user_email], password_hash: params[:user_password])
  redirect '/'
end

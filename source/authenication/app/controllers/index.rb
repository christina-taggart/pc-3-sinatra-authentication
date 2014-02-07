before do
	if session[:id]
		@logged_in = true
		@current_user = User.find(session[:id])
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
	user = User.find_by_email(params[:email])
	if user == nil
		@error = "Not a registered user."
	else
		if user.password == params[:password]
	  	session[:id] = user.id
	  else
	  	@error = "Incorrect Password"
	  end
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
  session[:id] = User.create_encryption(name: params[:user_name], email: params[:user_email], password_hash: params[:user_password]).id
  redirect '/'
end

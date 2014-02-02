#-----AUTHORIZATION FILTER-----

before do
  session[:id] ? @logged_in = true : false
  session[:id] ? @users = User.all : @users = nil
  session[:access_level] ? @access_level = session[:access_level] : @access_level = nil
end

#----- INDEX ------

get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  @error = session[:error]
  erb :sign_in
end

post '/sessions' do
  if User.authenticate(params[:email], params[:password])
    user = User.where(email: params[:email]).first
    session[:error] = nil
    session[:id] = user.id
    session[:access_level] = user.access_level
    redirect '/'
  else
    session[:error] = "Invalid email or password"
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:id] = nil
  session[:access_level] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  @error = session[:error]
  erb :sign_up
end

post '/users' do
  new_user = User.create(name: params[:name], email: params[:email], 
                         password_hash: params[:password_hash], access_level: "student")
  if new_user.save
    session[:error] = nil
    redirect '/sessions/new'
  else
    session[:error] = "Email must be unique."
    redirect '/users/new'
  end
end

delete '/users/:user_id' do
  User.find(params[:user_id]).destroy
  redirect '/'
end

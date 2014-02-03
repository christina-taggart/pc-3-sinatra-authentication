get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in 
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  session[:id] = @user.id
  login
  erb :index
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  @message = session[:user_create]
  erb :sign_up
end

post '/users' do
  user = params['user']
  new_user = User.new(name: user['name'], email: user['email'])
  new_user.password = params[:password]
  if new_user.valid?
    new_user.save
    redirect "/sessions/"
  else
    session[:user_create] = 'That email is already taken or your password is invalid.'
    redirect '/users/new'
  end
end

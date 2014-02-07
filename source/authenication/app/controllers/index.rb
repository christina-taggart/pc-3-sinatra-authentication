#enable sessions

before do
  @logged_in = false
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
  session[:user_id] = user.id
end

delete '/sessions/:id' do
  # sign-out -- invoked
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.create(name: params[:user_name], email: params[:user_email], password_hash: params[:user_password])
end

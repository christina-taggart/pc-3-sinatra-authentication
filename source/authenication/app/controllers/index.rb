#enable sessions

before do
  @logged_in = false
end

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
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
  # render sign-up page
end

post '/users' do
  # sign-up a new user
end

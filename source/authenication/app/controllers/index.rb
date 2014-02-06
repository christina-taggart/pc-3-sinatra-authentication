before do
  p session
  if session[:id]
    @logged_in = true
    @current_user = User.find(session[:id])
  else
    @logged_in = false
  end
end

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
end

post '/sessions' do
  # sign-in
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

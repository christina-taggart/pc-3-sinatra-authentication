#-----AUTHORIZATION FILTER-----

before do
  if session[:id] ? @logged_in = true : false
  if session[:id] ? @users = User.all : @users = nil
  if session[:access_level] ? @access_level = session[:access_level] : @access_level = nil
end

#----- INDEX ------

get '/' do
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

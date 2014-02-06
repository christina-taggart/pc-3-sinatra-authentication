get '/' do
  # render home page
  #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.find_by_email(params[:email])
  if user.authenticate_user(params[:password])
    session[:user_id] = user.id
  end
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked 
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  User.create(params[:user])
  redirect '/'
end

get '/' do
  # render home page
  @users = User.all
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
  if !user.nil? && user.authenticate_user(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Invalid username or password"
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session.clear
  redirect '/'
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

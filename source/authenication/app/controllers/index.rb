before do
  if session[:id] != nil
    @user = true
  else
    @user = false
  end
end

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 users = User.all
 @user_names = users.map do |user|
    user.name
  end
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  session[:id] = params[:id]
  # sign-in
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked 
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  User.create(name: params["user"]["name"], email: params["user"]["email"], password_hash: params["user"]["password"])
  redirect '/'
end

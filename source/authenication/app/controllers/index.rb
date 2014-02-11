get '/' do
 # render home page
 # Show all users if user is signed in
 @users = User.all if session[:id]
 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  login
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out
  logout
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  new_user = User.create(params[:user])
  if new_user.valid?
    session[:id] = new_user.id
    redirect '/'
  else
    flash[:errors] = new_user.errors.full_messages
    redirect '/users/new'
  end
end

#TODO: Add validations for name, password length ...